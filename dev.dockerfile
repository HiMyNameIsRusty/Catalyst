FROM ubuntu:latest

# Copy Directory
WORKDIR /root
COPY . .

# Update default packages
RUN apt-get update

# Get Ubuntu packages
RUN apt-get install -y \
    build-essential \
    curl

# Get Rust
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# Start Shell
CMD ["bash"]
