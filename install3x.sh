#!/bin/bash

# Обновление списка пакетов
sudo apt-get update

# Установка необходимых пакетов
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Добавление GPG ключа Docker в систему
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Добавление репозитория Docker
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Обновление списка пакетов после добавления репозитория Docker
sudo apt-get update

# Установка Docker Engine, CLI и Containerd
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Проверка установки Docker
sudo docker run hello-world

sudo apt install docker-compose-plugin

# Спросить пользователя об URL
read -p "Введите URL для скачивания: " url

# Использовать введённый URL в команде curl
curl "$url"

#клонируем репозиторий с контенером
git clone https://github.com/MHSanaei/3x-ui.git

#переходим в директорию с контейнером
cd 3x-ui/

#запускаем контенер
3x-ui/docker compose up -d
