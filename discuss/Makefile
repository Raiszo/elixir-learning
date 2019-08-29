.PHONY: install uninstall

all: install

install:
	docker-compose build --force-rm
	docker-compose run --rm api mix deps.get
	docker-compose down

uninstall:
	docker-compose down --rmi all
