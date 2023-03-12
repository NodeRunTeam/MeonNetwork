# MeonNetwork
Требования к серверу
4 GB RAM
CPU Dual Core
20GB SSD
8000 порт


1. А для начала обновим ядро Ubuntu:
sudo apt-get update && sudo apt-get upgrade -y

2. Далее для установки ноды нужен Docker:
wget https://raw.githubusercontent.com/NodeRunTeam/MeonNetwork/main/Install.sh && chmod +x Install.sh && ./Install.sh

3. Создаем папку для ноды

mkdir muon-node
cd muon-node

4. Скачиваем Docker-compose файл

curl -o docker-compose.yml https://raw.githubusercontent.com/muon-protocol/muon-node-js/testnet/docker-compose-pull.yml

5. Запускаем ноду
docker compose up -d

6. Проверяем ноду через браузер. 
Выполняем команду и переходим по ссылке которую выдали

echo http://$(wget -qO- eth0.me):8000/status

7. Проверяем есть ли данные и оставляем страницу открытой (нам потом понадобятся с нее данные)

8. Переходим по ссылке и подключаем кошелек MetaMask, который будем привязывать к ноде

https://alice.muon.net/

9. Идем в кран и запрашиваем токены для транзакций 

Как токены прийдут - возвращаемся на предыдущую страницу и минтим минимум 1000 ALICE.

10. Добавляем AlICE в MetaMusk кнопкой Aprove

Тут в поля Node Address и Peer Id вставляем данные, их копируем с страницы где открыта бода

11. На этом установку ноды Muon закончено! Через некоторое время начнут капать награды

