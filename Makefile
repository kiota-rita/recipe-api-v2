env-exists:
ifeq (,$(wildcard ./.env))
	    cp .env.example .env
endif

build: env-exists
	docker-compose build
start: env-exists
	docker-compose up
bash: env-exists
	docker-compose run web bash
specs: env-exists
	docker-compose run --rm -e "RAILS_ENV=test" web bundle exec rspec
swagger: env-exists
	docker-compose run --rm -e "RAILS_ENV=test" web rake rswag:specs:swaggerize
rubocop: env-exists
	docker-compose run --rm -e "RAILS_ENV=test" web rubocop `git diff --name-only --cached | grep '\.rb'`
routes: env-exists
	docker-compose run --rm -e "RAILS_ENV=test" web rails routes
