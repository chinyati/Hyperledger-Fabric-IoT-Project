docker-compose -f Host1.yaml down -v
docker rm $(docker ps -aq) --force
docker rmi $(docker images dev-* -q)
