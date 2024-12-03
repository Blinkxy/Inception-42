all : up

build:
	@mkdir -p /home/mzoheir/data
	@mkdir -p/home/mzoheir/data/MariaDB
	@mkdir -p /home/mzoheir/data/WordPressDB
	@docker compose -f ./srcs/docker-compose.yml up -d --build
up :
	@mkdir -p /home/mzoheir/data
	@mkdir -p /home/mzoheir/data/MariaDB
	@mkdir -p /home/mzoheir/data/WordPressDB
	@docker compose -f ./srcs/docker-compose.yml up

down :
	@sudo rm -rf /home/mzoheir/data
	@docker compose -f ./srcs/docker-compose.yml down
	@docker volume rm srcs_volumeMariadb
	@docker volume rm srcs_volumeWP

stop : 
	@docker compose -f ./srcs/docker-compose.yml stop

start : 
	@docker compose -f ./srcs/docker-compose.yml start
fclean : down
	@docker system prune -a

status :
	@docker ps