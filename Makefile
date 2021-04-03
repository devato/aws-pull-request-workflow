build:
	docker-compose -f docker-compose.yml build $(c)
down:
	docker-compose -f docker-compose.yml down $(c)
tests: 
	docker-compose -f docker-compose.yml run --rm test $(c)
check: 
	docker-compose -f docker-compose.yml run test mix do compile, format --check-formatted $(EX_FILES_CHANGED) $(c)
ci-test: 
	docker-compose -f docker-compose.yml run test mix do compile, format --check-formatted $(EX_FILES_CHANGED), test
