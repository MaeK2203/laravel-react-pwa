help:
	@grep "^[a-zA-Z\-]*:" Makefile | grep -v "grep" | sed -e 's/^/make /' | sed -e 's/://'
init:
	@make destroy
	@make build
	@make wait-for-mysql
	sleep 30
	docker compose exec app php artisan migrate:fresh --seed
	docker compose ps
build:
	mkcert --install
	mkcert -key-file infra/nginx/ssl/cert-key.pem -cert-file infra/nginx/ssl/cert.pem localhost 127.0.0.1 ::1
	docker compose up -d --build
	docker compose exec app composer install
	docker compose exec app cp .env.example .env
	docker compose exec app php artisan key:generate
rebuild:
	docker compose down --rmi local
	@make build
	docker compose ps
up:
	docker compose up -d
	docker compose ps
stop:
	docker compose stop
restart:
	docker compose down
	docker compose up -d
	docker compose ps
destroy:
	docker compose down --rmi local
	rm -rf server/vendor
	rm -rf server/.env
	rm -rf infra/nginx/ssl/cert-key.pem
	rm -rf infra/nginx/ssl/cert.pem
	find `pwd`/infra/mysql/data -mindepth 1 -maxdepth 1 | grep -v '.gitignore' | xargs rm -rf
	find `pwd`/infra/s3/data -mindepth 1 -maxdepth 1 | grep -v '.gitignore' | xargs rm -rf
wait-for-mysql:
	until (docker compose exec mysql mysqladmin ping &>/dev/null) do echo 'waiting for mysql wake up...' && sleep 3; done
migration:
	docker compose exec app php artisan migrate
migration-fresh:
	docker compose exec app php artisan migrate:fresh
migration-seed:
	docker compose exec app php artisan db:seed
lint:
	docker compose exec app /var/www/html/vendor/bin/phpstan analyse --memory-limit=2G
fmt:
	docker compose exec -T app /var/www/html/vendor/bin/pint --test --config pint.json $(FILE_PATHS)
fix:
	docker compose exec app /var/www/html/vendor/bin/pint -v --config pint.json
