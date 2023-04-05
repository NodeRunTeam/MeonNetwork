#!/bin/bash
exists()
{
  command -v "$1" >/dev/null 2>&1
}

echo "---------------------------------------------------"
echo -e "\e[32mШаг 1: Инициализация скрипта \e[0m" && sleep 2

sudo apt install curl -y
curl -s https://raw.githubusercontent.com/NodeRunTeam/NodeGuide/main/logo.sh | bash


echo "---------------------------------------------------"
echo -e "\e[32mВыберите действие. Введите на нужную цифру и подтвердите действие клавишей Enter\e[0m" && sleep 3
echo -e ""
echo "1 - Установить ноду (Muon)"

read doing

case $doing in 
  1) 
  echo "---------------------------------------------------"
  echo -e "\e[32mШаг 2: скачивание и установка ноды: \e[0m" && sleep 2

  sudo apt-get update && sudo apt-get upgrade -y
  sleep 3
  wget https://raw.githubusercontent.com/NodeRunTeam/NodeGuide/main/docker.sh
  chmod +x docker.sh && ./docker.sh
  sleep 3
  mkdir muon-node
  cd muon-node
  curl -o docker-compose.yml https://raw.githubusercontent.com/muon-protocol/muon-node-js/testnet/docker-compose-pull.yml
  sleep 3
  docker compose up -d

  echo "---------------------------------------------------"
  echo -e "Установка ноды завершена."
  echo "---------------------------------------------------"
  sleep 1
  echo "---------------------------------------------------"
  echo -e "Проверьте свою ноду Alice: \e[32mhttps://alice.muon.net/\e[39m"
  echo "---------------------------------------------------"
  ;;
esac
