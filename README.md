# poop_master

PooPool Client written in C++. Mines Marabu with GPU(OpenCL).

## Usage

```shell
./poop_master
# or with custom boost argument
./poop_master <boost_int>
```

The boost argument controls the number of work groups and affects the
performance greatly. The default boost is set to 1, but this is quite
slow for some cases. Please try different boost values. to find a potential
optimal value for your machine.

This `boost_int` value should be an integer >= 1. Recommended values:
- `boost_int = 1`
- `boost_int = 2`
- `boost_int = 4`
- `boost_int = 8`
- `boost_int = 16`
- `boost_int = 32`
- `boost_int = 64`
- `boost_int = 128`

Do not try too large values, since this is related to GPU hardware.

You could see a reported hashrate whenever you mined a block or a block
is mined by another client. You can check the hashrate and try another `boost`
argument to find a better working point.


## Instructions to compile

### Prerequisites
This is a cmake project. So you need to have `cmake` and `make` installed. In addition,
you need to have a c++ compiler installed, e.g. `g++` or `clang++`.

#### macOS
```shell
brew install cmake make
# you usually have compilers built-in or through xcode-select. In case you don't:
brew install g++
# or
brew install clang++
```

#### Linux
```shell
sudo apt-get install build-essential cmake make
```

#### Windows

Need contribution for this part. Don't have a Windows machine.

### Compile

This project is nested, with a dependency on `IXWebSocket`. This dependency is
included in the `IXWebSocket` directory. This repository should be compiled
and installed before compiling this project.

poop_master uses IXWebSocket to communicate with the server through WebSocket.

#### Compile `IXWebSocket`

Go to `IXWebSocket` directory and create a build directory. Inside the `build`
directory, run `cmake` to configure the project then use make to compile and install.

```shell
cd IXWebSocket
mkdir build
cd build
cmake -DUSE_TLS=0 ..; make -j;
sudo make install;
```

Note: IXWebSocket have some dependencies on `zlib` and `openssl`. For this
specific project, we do not need TLS for WebSocket communication. Therefore,
the `-DUSE_TLS=0` flag is used, and `openssl` is optional. But `zlib` is required.
If you see error regarding `zlib`, you can install it separately. This could happen
on Linux but not usual for macOS.

#### Compile `poop_master`

**Go to project root** and use `cmake` to configure the project.

```shell
cmake -S . -B build
cd build
cmake ..
make -j
```

`poop_master` is now compiled. You may find it in the `build` directory.

### Run

Go to the `build` directory and run `./poop_master`.

```shell
cd build
./poop_master
# or directly from the project root
./build/poop_master
```

## Current status

This project is currently in development.

Current Focus:

- [ ] A clear and robust communication protocol between client and server.
  - How to handle different types of error messages
- [ ] GPU mining Optimization
    - In `Miner.cpp`
    - When doing `Miner::update_payload`, it sets a `global` and `local` variable, which are used to specify global and 
work group and work item size for GPU kernel tasks.
    - They are basically `int` variables. But their values greatly affects the 
the performance of the GPU. I found it dependent on the GPU type. 
      - For example, on my M1 Pro. If the `boost` argument is set to `128`, the hashrate is maximized.
      - But on an NVIDIA RTX 3090, it needs to be set to `1` to maximize the hashrate.
    - **Any ideas on how this works?**
      - Some basic concepts are:
        - `global`: the total number of work items(i.e. hashes needs to be done) in the GPU.
        - `local`: the number of work items in each work group.
        - `global/local`: the number of work groups.
        - When a GPU kernel task is enqueued, each GPU compute unit takes a work group and finishes it.
        - Then a new work group is dequeued and executed.
        - So the number of compute units is the number of work groups that runs in parallel.
    - We can also make it a command line argument that can be changed based on platforms at runtime.

## Contributing

If you encounter any problems or have any questions, please feel free to
open an issue on GitHub. 
