new:
	docker run -it --rm -v $(pwd):/srv/pelican mjjacko/pelican pelican-quickstart -p my-site

start-interactive:
	cd $(SITE)
	docker run --rm -v $(pwd):/srv/pelican --name pelican-dev -p 8000:8000  mjjacko/pelican

start-daemon:
	cd $(SITE)
	docker run --rm -v $(pwd):/srv/pelican -d --name pelican-dev -p 8000:8000  mjjacko/pelican

stop:
	docker stop pelican-dev

logs:
	docker logs -f pelican-dev
