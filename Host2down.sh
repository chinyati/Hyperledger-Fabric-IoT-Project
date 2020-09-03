docker-compose -f ./docker/Host2.yaml down -v
docker rm $(docker ps -aq) --force
docker rmi $(docker images dev-* -q)
