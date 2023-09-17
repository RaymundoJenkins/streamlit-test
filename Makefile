.PHONY: config.tmpl

Hostname=127.0.0.1:5232
Path=admin/e497f651-c515-7ffd-60fa-cafcc1bbecc6/
Username=admin
Password=password

config: config.tmpl
	Hostname=$(Hostname) Path=$(Path) Username=$(Username) Password=$(Password) \
	envsubst < $< > $@

run: build
	docker run --rm -it -v $$(pwd)/sync.db:/root/.local/share/calcurse/caldav/sync.db rant:streamlit sh

build: config
	docker build -t rant:streamlit .