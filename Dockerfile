FROM nvidia/cuda:12.2.0-devel-ubuntu22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -yq ninja-build curl inotify-tools git wget python3 python3-pip doxygen libopengl-dev libglx-dev libgl1-mesa-dev libglew-dev libsdl2-dev libfontconfig1-dev libdevil-dev 
RUN python3 -m pip install cpplint
#RUN apt-get update && apt-get install -yq cmake
#RUN wget -O /tmp/cmake.sh "https://github.com/Kitware/CMake/releases/download/v3.23.0/cmake-3.23.0-linux-x86_64.sh"
RUN wget -O /tmp/cmake.sh "https://cmake.org/files/v3.18/cmake-3.18.0-Linux-x86_64.sh"
RUN chmod +x /tmp/cmake.sh
RUN echo -ne "y\ny\nn\n" | /tmp/cmake.sh --prefix=/usr/local
# not needed, since cuda-gdb exists:
#RUN apt-get update && apt-get install -yq gdb lldb
