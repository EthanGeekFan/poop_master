//
// Created by Yifan Yang on 5/30/22.
//

#ifndef POOP_MASTER_CLIENT_H
#define POOP_MASTER_CLIENT_H


#include "Miner.h"
#include <ixwebsocket/IXWebSocket.h>

class Client {
private:
    Miner miner{};
    ix::WebSocket ws;
    bool task_updated;
    std::string block_prefix;
    std::string block_suffix;

    void routine();
    void next_task();
    void update_task(const std::string& prefix, const std::string& suffix, unsigned int *nonce_start, unsigned int *nonce_end);
    void start_task();

public:
    explicit Client(std::string& url);
    ~Client();
};


#endif //POOP_MASTER_CLIENT_H
