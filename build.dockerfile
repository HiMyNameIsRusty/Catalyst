from ubuntu:latest

RUN mkdir ~/.catalyst
COPY ./example/config/ ~/.catalyst
COPY ./example/project/ ~/root
COPY ./source /build

WORKDIR ~

RUN apt update

# Get Ubuntu packages
RUN apt-get install -y \
    build-essential \
    curl

# Get Rust
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

RUN rustc /build/main.rs
RUN cp ./main /bin/cata

CMD ["bash"]

