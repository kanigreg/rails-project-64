deploy:
	git push heroku main

setup:
	bin/setup

test:
	bin/rails test

.PHONY: test
