sudo apt-get update && sudo apt-get upgrade -y
https://raw.githubusercontent.com/NodeRunTeam/MeonNetwork/main/docker.sh
mkdir muon-node
cd muon-node
curl -o docker-compose.yml https://raw.githubusercontent.com/muon-protocol/muon-node-js/testnet/docker-compose-pull.yml
docker compose up -d
