cmake_minimum_required(VERSION 3.22)
project(poop_master)

set(CMAKE_CXX_STANDARD 14)

add_executable(poop_master main.cpp Miner.h Miner.cpp cl_helper.h utils.h Client.cpp Client.h)

target_link_libraries(poop_master
        "-framework OpenCL"
        "-framework Foundation"
        "-framework Security"
        )

find_library(WebSocket_LIBRARY
        NAMES ixwebsocket
        )

target_link_libraries(poop_master ${WebSocket_LIBRARY})
target_link_libraries(poop_master z)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/IXWebSocket)