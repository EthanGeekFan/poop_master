//
// Created by Yifan Yang on 5/30/22.
//

#include "Client.h"
#include <iostream>
#include "json.hpp"

using json = nlohmann::json;

Client::Client(std::string& url, std::string SUNetID, int boost) {
    miner.init();
    this->boost = boost;
    this->SUNetID = SUNetID;
    ws.setUrl(url);
    // handle keyboard interrupt
    signal(SIGINT, [](int) {
        std::cout << "Keyboard interrupt, exiting..." << std::endl;
        exit(0);
    });
    printf("Connecting to pool at %s\n", url.c_str());
    ws.setOnMessageCallback([this](const ix::WebSocketMessagePtr &msg) {
        if (msg->type == ix::WebSocketMessageType::Message) {
            std::cout << "Received message: " << msg->str << std::endl;
            try {
                json data = json::parse(msg->str);
                std::string msg_type = data["type"];
                if (msg_type == "gpu_task") {
                    if (this->miner.task_status == TaskStatus::RUNNING) {
                        std::cout << "ERROR: Received task while task is running" << std::endl;
                        return;
                    }
                    unsigned int nonce_start[8];
                    for (int i = 0; i < 8; i++) {
                        nonce_start[i] = data.at("task").at("nonce_start").at(i);
                    }
                    unsigned int nonce_end[8];
                    for (int i = 0; i < 8; i++) {
                        nonce_end[i] = data.at("task").at("nonce_end").at(i);
                    }
                    std::string block_prefix = data["task"]["block_prefix"];
                    std::string block_suffix = data["task"]["block_suffix"];
                    update_task(block_prefix, block_suffix, nonce_start, nonce_end);
                } else if (msg_type == "newBlock") {
                    if (this->miner.task_status != TaskStatus::RUNNING) {
                        std::cout << "ERROR: Received newBlock while task is not running" << std::endl;
                        this->next_task();
                        return;
                    }
                    // end task
                    this->miner.stop = true;
                } else if (msg_type == "error") {
                    this->miner.stop = true;
                } else if (msg_type == "confirm") {
                    std::cout << "Contributed 1 credit as " << data["SUNetID"] << std::endl;
                } else {
                    printf("Unknown message type: %s\n", msg_type.c_str());
                }
            } catch (std::exception& e) {
                std::cout << "Error: " << e.what() << std::endl;
                return;
            }
        } else if (msg->type == ix::WebSocketMessageType::Open) {
            std::cout << "Connection established" << std::endl;
        } else if (msg->type == ix::WebSocketMessageType::Error) {
            printf("Error: %s\n", msg->str.c_str());
        } else if (msg->type == ix::WebSocketMessageType::Close) {
            this->miner.stop = true;
            printf("Connection closed\n");
        }
    });
    ws.enableAutomaticReconnection();
    ws.setPingInterval(45);
    ws.start();
    routine();
}

Client::~Client() {
    ws.stop();
}

void sleep_ms(int ms) {
    std::this_thread::sleep_for(std::chrono::milliseconds(ms));
}

void Client::routine() {
    while (true) {
        try {
            while (ws.getReadyState() != ix::ReadyState::Open) {
                sleep_ms(100);
            }
            while (ws.getReadyState() == ix::ReadyState::Open) {
                next_task();
                std::cout << "Waiting for task update..." << std::endl;
                while (!this->task_updated) {
                    sleep_ms(100);
                }
                std::cout << "Task Updated\n" << std::endl;
                task_updated = false;
                start_task();
            }
        } catch (const std::exception &e) {
            std::cout << "Exception: " << e.what() << std::endl;
        }
    }
}

void Client::next_task() {
    ws.send(R"({"type":"gpu_task"})");
}

void Client::update_task(std::string prefix, std::string suffix, unsigned int *nonce_start,
                         unsigned int *nonce_end) {
    block_prefix = prefix;
    block_suffix = suffix;
    miner.update_payload(prefix, suffix, nonce_start, nonce_end, this->boost);
    task_updated = true;
}

void Client::start_task() {
    uint64_t start_time = std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::system_clock::now().time_since_epoch()).count();
    std::thread mining_thread([&]() {
        miner.start_mining();
    });
    mining_thread.join();
    uint64_t end_time = std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::system_clock::now().time_since_epoch()).count();
    std::cout << "Mining time: " << end_time - start_time << " ms" << std::endl;
    if (miner.task_status == TaskStatus::SUCCESS) {
        std::cout << "Successfully mined a block:" << std::endl;
        // print block
        std::string block_str = block_prefix + miner.get_result() + block_suffix;
        std::cout << block_str << std::endl;
        // send block to pool
        json data;
        data["type"] = "submit";
        data["block"] = block_str;
        data["SUNetID"] = SUNetID;
        ws.send(data.dump());
    } else {
        std::cout << "Failed mining block" << std::endl;
    }
}
