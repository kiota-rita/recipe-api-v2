build: 
	docker-compose build
start: 
	docker-compose up
bash: 
	docker-compose run web bash
specs: 
	docker-compose run --rm -e "RAILS_ENV=test" web bundle exec rspec
swagger: 
	docker-compose run --rm -e "RAILS_ENV=test" web rake rswag:specs:swaggerize
rubocop: 
	docker-compose run --rm -e "RAILS_ENV=test" web rubocop `git diff --name-only --cached | grep '\.rb'`
routes: 
	docker-compose run --rm -e "RAILS_ENV=test" web rails routes
