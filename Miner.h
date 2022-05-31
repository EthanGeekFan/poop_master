//
// Created by Yifan Yang on 5/30/22.
//

#ifndef POOP_MASTER_MINER_H
#define POOP_MASTER_MINER_H

#include <OpenCl/opencl.h>
#include <string>

enum TaskStatus {
    FAILED,
    SUCCESS,
    NOT_STARTED,
    RUNNING,
};

class Miner
{
private:
    cl_device_id device_id;
    cl_context context;
    cl_command_queue commands;
    cl_program program;
    cl_kernel kernel;
    size_t local;
    size_t work_group_size;
    size_t dev_max_work_group_size;
    size_t compute_units;
    size_t global;
    cl_mem prefix_buffer;
    cl_int prefix_len;
    cl_mem suffix_buffer;
    cl_int suffix_len;
    cl_mem nonce_start_buffer;
    cl_mem out_buffer;
    cl_mem payload_mem_buffer;
    cl_int payload_len;
    unsigned int *nonce_start_num;
    unsigned int *nonce_end_num;
    std::string result_nonce;

public:
    TaskStatus task_status;
    bool stop;

public:
    Miner() = default;
    void init();
    void update_payload(const std::string& prefix, const std::string& suffix, unsigned int *nonce_start, unsigned int *nonce_end, size_t boost);
    void start_mining();
    std::string get_result();
    ~Miner();
};

#endif //POOP_MASTER_MINER_H
