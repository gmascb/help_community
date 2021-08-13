up:
	docker-compose up

b:
	docker-compose up --build

rswag:
	rake rswag:specs:swaggerize

pid: 
	rm -r tmp/pids/server.pid