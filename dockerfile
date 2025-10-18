FROM ubuntu
RUN apt-get update 
RUN apt-get install -y git build-essential libpcap0.8-dev cmake
RUN git clone https://github.com/xfangfang/PPPwn_cpp.git
WORKDIR "/PPPwn_cpp"
RUN cmake -B build
RUN cmake --build build -t pppwn
COPY ./1100/stage1 /PPPwn_cpp/build/stage1
COPY ./1100/stage2 /PPPwn_cpp/build/stage2

WORKDIR "/PPPwn_cpp/build"
CMD ["./pppwn","--interface","enp5s0","--auto-retry"]
