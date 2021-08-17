up:
	docker-compose up

b:
	docker-compose up --build

rswag:
	rake rswag:specs:swaggerize

pid: 
	rm -r tmp/pids/server.pid

exec_web:
	docker exec -it helping_community_web_1 sh

exec_db:
	docker exec -it helping_community_db_1 sh