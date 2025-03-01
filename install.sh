#!/bin/bash

# Кольори для виділення
green='\033[0;32m'
nc='\033[0m'

# Завантаження та запуск логотипу
wget -q https://raw.githubusercontent.com/88n77/Logo-88n77/main/logo.sh
chmod +x logo.sh
./logo.sh

# URL-адреси для дій
setup_url="https://raw.githubusercontent.com/88n77NODES/NEXUS/main/setup.sh"
update_url="https://raw.githubusercontent.com/88n77NODES/NEXUS/main/update.sh"
delete_url="https://raw.githubusercontent.com/88n77NODES/NEXUS/main/delete.sh"

# Меню опцій
menu_options=("Встановити" "Оновити" "Видалити" "Вийти")
PS3='Оберіть дію: '

select choice in "${menu_options[@]}"
do
    case $choice in
        "Встановити")
            echo -e "${green}Встановлення...${nc}"
            bash <(curl -s $setup_url)
            ;;
        "Оновити")
            echo -e "${green}Оновлення...${nc}"
            bash <(curl -s $update_url)
            ;;
        "Видалити")
            echo -e "${green}Видалення...${nc}"
            bash <(curl -s $delete_url)
            ;;
        "Вийти")
            echo -e "${green}Вихід...${nc}"
            break
            ;;
        *)
            echo "Невірний вибір!"
            ;;
    esac
done
