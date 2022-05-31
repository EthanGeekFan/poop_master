//
// Created by Yifan Yang on 5/30/22.
//
#include "cl_helper.h"
#include "utils.h"
#include "Miner.h"
#include <ctime>
#include <fstream>
#include <iostream>
#include <cstdio>
#include <string>
#include "sha256_cl.h"

#define NONCE_STR_LEN 64

void Miner::init()
{
    // read sha256.cl to char*
//    std::ifstream in("/Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/sha256.cl");
//    std::string str((std::istreambuf_iterator<char>(in)),
//                    std::istreambuf_iterator<char>());
    unsigned char *source_str = sha256_cl;

    // init cl environment
    cl_int cl_err;
    cl_err = clGetDeviceIDs(nullptr, CL_DEVICE_TYPE_GPU, 1, &device_id, nullptr);
    context = clCreateContext(nullptr, 1, &device_id, nullptr, nullptr, &cl_err);
    commands = clCreateCommandQueue(context, device_id, 0, &cl_err);
    program = clCreateProgramWithSource(context, 1, (const char **)&source_str, nullptr, &cl_err);
    clBuildProgram(program, 0, nullptr, nullptr, nullptr, nullptr);
    kernel = clCreateKernel(program, "mine", &cl_err);
    cl_err = clGetKernelWorkGroupInfo(kernel, device_id, CL_KERNEL_WORK_GROUP_SIZE, sizeof(work_group_size), &work_group_size, nullptr);
    cl_err = clGetDeviceInfo(device_id, CL_DEVICE_MAX_COMPUTE_UNITS, sizeof(compute_units), &compute_units, nullptr);
    cl_err = clGetDeviceInfo(device_id, CL_DEVICE_MAX_WORK_GROUP_SIZE, sizeof(dev_max_work_group_size), &dev_max_work_group_size, nullptr);
    local = work_group_size;
    global = local;
    // print device info
    char buf[1024];
    clGetDeviceInfo(device_id, CL_DEVICE_NAME, sizeof(buf), buf, nullptr);
    printf("Device Name: %s\n", buf);
    printf("Work Group Size: %d\n", (int)global);
    printf("Compute Units: %d\n", (int)compute_units);
    stop = false;
    task_status = NOT_STARTED;
}

void Miner::update_payload(const std::string& prefix, const std::string& suffix, unsigned int *nonce_start, unsigned int *nonce_end, size_t boost)
{
    if (task_status == RUNNING)
    {
        return;
    }
    // assert(boost * compute_units <= dev_max_work_group_size);
    // configure work group size
    global = work_group_size * boost * compute_units;
    local = work_group_size;

//    printf("\n");
//    printf("Configure:\n");
//    printf("Work Items: %d\n", (int)global);
//    printf("Work Groups: %d\n", (int)(global / local));
//    printf("Work Group Size: %d\n", (int)local);
//    printf("Compute Units: %d\n", (int)compute_units);
//    printf("Boost: %d\n", (int)boost);
//    printf("\n");

    cl_int cl_err;
    const char *prefix_c = prefix.c_str();
    const char *suffix_c = suffix.c_str();
    prefix_len = (int)prefix.length();
    suffix_len = (int)suffix.length();
    payload_len = prefix_len + suffix_len + NONCE_STR_LEN;

    int payload_word_len = payload_len / 4;
    if (4 * payload_word_len != payload_len)
    {
        payload_word_len++;
    }
    payload_len = payload_word_len * 4;

    // create buffer
    if (prefix_buffer != nullptr)
    {
        clReleaseMemObject(prefix_buffer);
    }
    prefix_buffer = clCreateBuffer(context, CL_MEM_READ_ONLY, prefix_len, nullptr, &cl_err);
    if (suffix_buffer != nullptr)
    {
        clReleaseMemObject(suffix_buffer);
    }
    suffix_buffer = clCreateBuffer(context, CL_MEM_READ_ONLY, suffix_len, nullptr, &cl_err);
    cl_err = clEnqueueWriteBuffer(commands, prefix_buffer, CL_TRUE, 0, prefix_len, prefix_c, 0, nullptr, nullptr);
    cl_err = clEnqueueWriteBuffer(commands, suffix_buffer, CL_TRUE, 0, suffix_len, suffix_c, 0, nullptr, nullptr);
    nonce_start_buffer = clCreateBuffer(context, CL_MEM_READ_ONLY, sizeof(unsigned int) * 8, nullptr, &cl_err);
    nonce_start_num = nonce_start;
    nonce_end_num = nonce_end;
    cl_err = clEnqueueWriteBuffer(commands, nonce_start_buffer, CL_TRUE, 0, sizeof(unsigned int) * 4, nonce_start_num, 0, nullptr, nullptr);
    out_buffer = clCreateBuffer(context, CL_MEM_WRITE_ONLY, sizeof(unsigned int) * 17, nullptr, &cl_err);
    payload_mem_buffer = clCreateBuffer(context, CL_MEM_READ_WRITE, sizeof(char) * payload_len * global, nullptr, &cl_err);
}

void Miner::start_mining()
{
    if (task_status == RUNNING)
    {
        return;
    }
    task_status = RUNNING;
    cl_int cl_err;
    // prepare args
    cl_err = clSetKernelArg(kernel, 0, sizeof(cl_mem), &prefix_buffer);
    cl_err = clSetKernelArg(kernel, 1, sizeof(cl_int), &prefix_len);
    cl_err = clSetKernelArg(kernel, 2, sizeof(cl_mem), &suffix_buffer);
    cl_err = clSetKernelArg(kernel, 3, sizeof(cl_int), &suffix_len);
    cl_err = clSetKernelArg(kernel, 4, sizeof(cl_mem), &nonce_start_buffer);
    cl_err = clSetKernelArg(kernel, 5, sizeof(cl_mem), &out_buffer);
    cl_err = clSetKernelArg(kernel, 6, sizeof(cl_mem), &payload_mem_buffer);

    // start timer
    uint64_t start = milliseconds_since_epoch();
    unsigned int iter = 0;
    // run kernel
    while (true)
    {
        // run kernel
        cl_err = clEnqueueNDRangeKernel(commands, kernel, 1, nullptr, &global, &local, 0, nullptr, nullptr);
        cl_err = clFinish(commands);

        if (cl_err != 0)
        {
            printf("error: %s\n", cl_error_to_str(cl_err));
        }

        // read result
        unsigned int result[17];
        cl_err = clEnqueueReadBuffer(commands, out_buffer, CL_TRUE, 0, sizeof(unsigned int) * 17, result, 0, nullptr, nullptr);
        if (result[16] != 1)
        {
            add_nonce(nonce_start_num, global);
            cl_err = clEnqueueWriteBuffer(commands, nonce_start_buffer, CL_TRUE, 0, sizeof(unsigned int) * 8, nonce_start_num, 0, nullptr, nullptr);
        }
        else
        {
            printf("Found a block!\n");
            char buf[65];
            buf[64] = '\0';
            write_nonce(result, buf);
            printf("nonce: %s\n", buf);
            result_nonce = std::string() + buf;
            task_status = SUCCESS;
            break;
        }
        iter++;
        if (stop) {
            task_status = FAILED;
            stop = false;
            break;
        }
    }
    // stop timer
    uint64_t end = milliseconds_since_epoch();
    printf("time: %.3f s\n", (double)(end - start) / 1000.0);
    printf("iterations: %lu\n", iter * global);
    printf("Hash rate: %.3f MH/s\n", (double)global * iter / 1000.0 / (double)(end - start));
}

Miner::~Miner()
{
    clReleaseMemObject(prefix_buffer);
    clReleaseMemObject(suffix_buffer);
    clReleaseMemObject(nonce_start_buffer);
    clReleaseMemObject(out_buffer);
    clReleaseMemObject(payload_mem_buffer);
    clReleaseKernel(kernel);
    clReleaseProgram(program);
    clReleaseCommandQueue(commands);
    clReleaseContext(context);
    printf("miner destructed\n");
}

std::string Miner::get_result() {
    if (task_status != SUCCESS)
    {
        return "";
    }
    return result_nonce;
}
