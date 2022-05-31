# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

# Default target executed when no arguments are given to make.
default_target: all
.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.23.2/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.23.2/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/yifanyang/Documents/Study/Stanford/EE374/poop_master

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/yifanyang/Documents/Study/Stanford/EE374/poop_master

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake cache editor..."
	/opt/homebrew/Cellar/cmake/3.23.2/bin/ccmake -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache
.PHONY : edit_cache/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/opt/homebrew/Cellar/cmake/3.23.2/bin/cmake --regenerate-during-build -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache
.PHONY : rebuild_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/CMakeFiles /Users/yifanyang/Documents/Study/Stanford/EE374/poop_master//CMakeFiles/progress.marks
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /Users/yifanyang/Documents/Study/Stanford/EE374/poop_master/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean
.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named poop_master

# Build rule for target.
poop_master: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 poop_master
.PHONY : poop_master

# fast build rule for target.
poop_master/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/poop_master.dir/build.make CMakeFiles/poop_master.dir/build
.PHONY : poop_master/fast

Client.o: Client.cpp.o
.PHONY : Client.o

# target to build an object file
Client.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/poop_master.dir/build.make CMakeFiles/poop_master.dir/Client.cpp.o
.PHONY : Client.cpp.o

Client.i: Client.cpp.i
.PHONY : Client.i

# target to preprocess a source file
Client.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/poop_master.dir/build.make CMakeFiles/poop_master.dir/Client.cpp.i
.PHONY : Client.cpp.i

Client.s: Client.cpp.s
.PHONY : Client.s

# target to generate assembly for a file
Client.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/poop_master.dir/build.make CMakeFiles/poop_master.dir/Client.cpp.s
.PHONY : Client.cpp.s

Miner.o: Miner.cpp.o
.PHONY : Miner.o

# target to build an object file
Miner.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/poop_master.dir/build.make CMakeFiles/poop_master.dir/Miner.cpp.o
.PHONY : Miner.cpp.o

Miner.i: Miner.cpp.i
.PHONY : Miner.i

# target to preprocess a source file
Miner.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/poop_master.dir/build.make CMakeFiles/poop_master.dir/Miner.cpp.i
.PHONY : Miner.cpp.i

Miner.s: Miner.cpp.s
.PHONY : Miner.s

# target to generate assembly for a file
Miner.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/poop_master.dir/build.make CMakeFiles/poop_master.dir/Miner.cpp.s
.PHONY : Miner.cpp.s

main.o: main.cpp.o
.PHONY : main.o

# target to build an object file
main.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/poop_master.dir/build.make CMakeFiles/poop_master.dir/main.cpp.o
.PHONY : main.cpp.o

main.i: main.cpp.i
.PHONY : main.i

# target to preprocess a source file
main.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/poop_master.dir/build.make CMakeFiles/poop_master.dir/main.cpp.i
.PHONY : main.cpp.i

main.s: main.cpp.s
.PHONY : main.s

# target to generate assembly for a file
main.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/poop_master.dir/build.make CMakeFiles/poop_master.dir/main.cpp.s
.PHONY : main.cpp.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... edit_cache"
	@echo "... rebuild_cache"
	@echo "... poop_master"
	@echo "... Client.o"
	@echo "... Client.i"
	@echo "... Client.s"
	@echo "... Miner.o"
	@echo "... Miner.i"
	@echo "... Miner.s"
	@echo "... main.o"
	@echo "... main.i"
	@echo "... main.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

