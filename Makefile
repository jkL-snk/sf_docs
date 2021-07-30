build:
	docker build -t mypelican:v1 .

run:
	docker run --name pelican -v $(pwd):/workspace mypelican:v1 pelican -o /workspace/output -s /workspace/pelicanconf.py
	
start: build run
