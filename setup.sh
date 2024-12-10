#!/bin/bash

GREEN='\e[38;5;46m'
YELLOW='\e[38;5;226m'
RESET='\e[0m'

echo -e "${YELLOW}Оновлюємо сервер та встановлюємо необхідні компоненти...${RESET}"
sudo apt update && sudo apt upgrade -y
sudo apt install build-essential pkg-config libssl-dev git-all -y
sudo apt install -y protobuf-compiler
sudo apt install -y cargo

echo -e "${YELLOW}Завантажуємо та встановлюємо Rust...${RESET}"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
rustup update

echo -e "${YELLOW}Встановлюємо screen для створення сесій...${RESET}"
sudo apt install -y screen
screen -dmS nexus 

echo -e "${YELLOW}Завантажуємо та запускаємо скрипт Nexus...${RESET}"
curl https://cli.nexus.xyz/ | bash

echo -e "${GREEN}Скрипт завершено! Нода Nexus встановлена та запущена у сесії screen.${RESET}"
