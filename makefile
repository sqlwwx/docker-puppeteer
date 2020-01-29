VERSION ?= $(shell git describe --tags `git rev-list --tags --max-count=1` | sed -e 's/^v//')
RELEASES = patch minor major

build:
	docker build -t sqlwwx/puppeteer:$(VERSION) -t sqlwwx/puppeteer:latest .

publish: build
	docker push sqlwwx/puppeteer:$(VERSION)
	docker push sqlwwx/puppeteer:latest

.PHONY: $(RELEASES)
$(RELEASES):
	$(PWD)/node_modules/.bin/standard-version --release-as $@
	git push --follow-tags origin master

.PHONY: build publish
