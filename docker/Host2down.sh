docker-compose -f Host2.yaml down -v
docker rm $(docker ps -aq)
docker rmi $(docker images dev-* -q)
