#!/bin/bash
wget https://raw.githubusercontent.com/NodeRunTeam/NodeGuide/main/logo.sh
chmod +x logo.sh && ./logo.sh
sleep 7
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
