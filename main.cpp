#include <string>
#include <iostream>
#include "Client.h"


int main(int argc, char* argv[])
{
    std::string url = "ws://45.77.6.79:6666/";
    std::string SUNetID;
    // parse command line arguments
    int boost = 1;
    // accept boost as the only command line argument
    if (argc >= 2) {
        SUNetID = argv[1];
    }
    if (argc == 3) {
        boost = std::stoi(argv[2]);
        if (boost < 1) {
            boost = 1;
        }
    } else {
        std::cout << "Usage: " << argv[0] << " <SUNetID> [boost]" << std::endl;
        return 1;
    }
    std::cout << "SUNetID: " << SUNetID << std::endl;
    std::cout << "Using Boost: " << boost << std::endl;
    Client client(url, SUNetID, boost);
    return 0;
}