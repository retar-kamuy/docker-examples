PORT = 8086

NETWORK = redmine-network

SERVER_NAME = redmine

DB_NAME = postgres
DB_USERNAME = redmine
DB_PASSWORD = redmine

network:
	docker network create --driver bridge $(NETWORK)

#.PHONY: mkdir_postgres
mkdir_postgres:
ifeq ("$(wildcard $(CURDIR)/postgres)", "")
	mkdir $(CURDIR)/postgres
endif

db: network mkdir_postgres
	docker run --detach \
		--name $(DB_NAME) \
		--net $(NETWORK) \
		--env POSTGRES_PASSWORD=$(DB_PASSWORD) \
		--env POSTGRES_USER=$(DB_USERNAME) \
		--env TZ=Asia/Tokyo \
		--volume $(CURDIR)/postgres:/var/lib/postgresql/data \
		postgres

mkdir_redmine:
ifeq ("$(wildcard $(CURDIR)/redmine)", "")
	mkdir $(CURDIR)/redmine
endif

server: db mkdir_redmine
	docker run --detach \
		--name $(SERVER_NAME) \
		--net $(NETWORK) \
		--publish $(PORT):3000 \
		--env REDMINE_DB_POSTGRES=$(DB_NAME) \
		--env REDMINE_DB_USERNAME=$(DB_USERNAME) \
		--env REDMINE_DB_PASSWORD=$(DB_PASSWORD) \
		--volume $(CURDIR)/redmine:/usr/src/redmine/files \
		redmine

clean:
	docker rm -f $(DB_NAME) $(SERVER_NAME)
	docker network rm $(NETWORK)
	docker image rm postgres redmine
