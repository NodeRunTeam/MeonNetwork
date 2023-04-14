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
echo "2 - Обновить ноду (Muon)"

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
  2) 
  echo "---------------------------------------------------"
  echo -e "\e[32mШаг 2: Обновляем ноду Meon: \e[0m" && sleep 2

  cd ~
  sleep 3
  docker cp muon-node:/usr/src/muon-node-js/.env ./backup.env
  sleep 3
  docker stop muon-node redis mongo
  docker rm muon-node redis mongo
  rm muon-node-js -rf
  sleep 3
  curl -o docker-compose.yml https://raw.githubusercontent.com/muon-protocol/muon-node-js/testnet/docker-compose-pull.yml
  docker-compose pull
  docker-compose up -d
  sleep 3
  docker cp backup.env muon-node:/usr/src/muon-node-js/backup.env
  docker exec -it muon-node ./node_modules/.bin/ts-node ./src/cmd keys restore backup.env
  docker restart muon-node
  sleep 3
  sudo ufw allow 8000/tcp
  sudo ufw allow 4000/tcp

  echo "---------------------------------------------------"
  echo -e "Обновление ноды Meon завершена."
  echo "---------------------------------------------------"
  sleep 1
  echo "---------------------------------------------------"
  echo -e "Проверьте свою ноду Alice: \e[32mhttps://alice.muon.net/\e[39m"
  echo "---------------------------------------------------"
  ;;
esac
