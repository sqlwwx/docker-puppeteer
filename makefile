build:
	docker build --cache-from sqlwwx/puppeteer:latest -t sqlwwx/puppeteer:latest .
publish: build
	docker push sqlwwx/puppeteer:latest

.PHONY: build publish
