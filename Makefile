up:
	docker-compose build dev
	docker-compose up -d
	docker-compose exec dev yarn install --pure-lockfile
	docker-compose exec dev yarn sequelize db:migrate
	docker-compose exec dev yarn dev:watch

build:
	docker-compose build --pull outline

test:
	docker-compose up -d redis postgres s3
	yarn sequelize db:drop --env=test
	yarn sequelize db:create --env=test
	yarn sequelize db:migrate --env=test
	yarn test

watch:
	docker-compose up -d redis postgres s3
	yarn sequelize db:drop --env=test
	yarn sequelize db:create --env=test
	yarn sequelize db:migrate --env=test
	yarn test:watch

destroy:
	docker-compose stop
	docker-compose rm -f

.PHONY: up build destroy test watch # let's go to reserve rules names
