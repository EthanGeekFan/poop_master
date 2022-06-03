#include <string>
#include <iostream>
#include "Client.h"


int main(int argc, char* argv[])
{
    std::string url = "ws://45.77.6.79:6666/";
    // parse command line arguments
    int boost = 1;
    // accept boost as the only command line argument
    if (argc > 1) {
        boost = std::stoi(argv[1]);
        if (boost < 1) {
            boost = 1;
        }
    }
    std::cout << "Using Boost: " << boost << std::endl;
    Client client(url, boost);
    return 0;
}