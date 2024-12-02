all : up

build:
	@mkdir /home/mzoheir/data
	@mkdir /home/mzoheir/data/MariaDB
	@mkdir /home/mzoheir/data/WordPressDB
	@docker compose -f ./srcs/docker-compose.yml up -d --build
up :
	@mkdir /home/mzoheir/data
	@mkdir /home/mzoheir/data/MariaDB
	@mkdir /home/mzoheir/data/WordPressDB
	@docker compose -f ./srcs/docker-compose.yml up -d

down :
	@sudo rm -rf /home/mzoheir/data
	@docker compose -f ./srcs/docker-compose.yml down

stop : 
	@docker compose -f ./srcs/docker-compose.yml stop

start : 
	@docker compose -f ./srcs/docker-compose.yml start
fclean :
	@docker system prune -a

status :
	@docker ps