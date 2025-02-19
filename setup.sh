#!/bin/bash

GREEN='\e[38;5;46m'
YELLOW='\e[38;5;226m'
RESET='\e[0m'

# Оновлення серверу та встановлення необхідних компонентів
echo -e "${YELLOW}Оновлюємо сервер...${RESET}"
sudo apt update && sudo apt upgrade -y

echo -e "${YELLOW}Встановлюємо необхідні пакети...${RESET}"
sudo apt install build-essential pkg-config libssl-dev git-all -y
sudo apt install -y protobuf-compiler
sudo apt install cargo

# Встановлення Rust
echo -e "${YELLOW}Встановлюємо Rust...${RESET}"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
rustup update

# Оновлення protobuf
echo -e "${YELLOW}Оновлюємо protobuf...${RESET}"
sudo apt remove -y protobuf-compiler
curl -LO https://github.com/protocolbuffers/protobuf/releases/download/v25.2/protoc-25.2-linux-x86_64.zip
unzip protoc-25.2-linux-x86_64.zip -d $HOME/.local
export PATH="$HOME/.local/bin:$PATH"
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# Перевірка встановленої версії protobuf
echo -e "${GREEN}Перевіряємо версію protobuf:${RESET}"
protoc --version
echo -e "${YELLOW}Встановлюємо screen для створення сесій...${RESET}"
sudo apt install -y screen

echo -e "${GREEN}Скрипт завершено! Запустіть Nexus у фоновій сесії screen.${RESET}"
echo -e "${YELLOW}Щоб підключитися до сесії, використовуйте команду:${RESET} screen -r nexus"