new:
	docker run -it --rm -v $(CURDIR):/srv/pelican mjjacko/pelican pelican-quickstart -p $(SITE)

start-interactive:
	docker run --rm -v $(CURDIR)/$(SITE):/srv/pelican --name pelican-dev -p 8000:8000  mjjacko/pelican

start-daemon:
	docker run --rm -v $(CURDIR)/$(SITE):/srv/pelican -d --name pelican-dev -p 8000:8000  mjjacko/pelican

stop:
	docker stop pelican-dev

logs:
	docker logs -f pelican-dev

debug:
	echo $(CURDIR)
