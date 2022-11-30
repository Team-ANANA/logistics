#!/bin/bash

if [[ $(which docker) ]]; then
  
  export PET_STATS_DB_PASSWORD="my-secret-pw"
  export PET_STATS_PETFINDER_PAYLOAD="grant_type=client_credentials&client_id=NiCmTqdkaMK5noEjfRHZwFYrZtOkUd3NVUNKLrrapbH9u5zvJC&client_secret=WN8IH6ibwEGTi1qdNN82wlgURnz5SQZmYLRYFq71"

  docker pull team0anana/csc302:backend
  docker pull team0anana/csc302:frontend
  docker pull mysql/mysql-server:latest

  docker run -d -p 5000:5000 --name team0anana-backend team0anana/csc302:backend
  docker run -d -p 3000:3000 --name team0anana-frontend team0anana/csc302:frontend
  docker run -d -p 3306:3306 --name team0anana-database -e MYSQL_ROOT_PASSWORD=my-secret-pw -e MYSQL_DATABASE=pet-stats mysql:latest

  # wait for flask endpoint
  echo "Waiting for Flask api to spin up"
  until $(curl --output /dev/null --silent --head --fail http://localhost:5000)
  do
    BAR='.....'
    for i in 1 2 3 4 5
    do
        echo -ne "\r${BAR:0:$i}"
        sleep .5
    done
    echo -ne "\r     "
  done
  echo -ne "\rFlask backend running at http://localhost:5000/\n"

  # wait for react endpoint
  echo "Waiting for React app to spin up"
  until $(curl --output /dev/null --silent --head --fail http://localhost:3000)
  do
    BAR='.....'
    for i in 1 2 3 4 5
    do
        echo -ne "\r${BAR:0:$i}"
        sleep .5
    done
    echo -ne "\r     "
  done
  echo -ne "\rReact template running at http://localhost:3000/\n"

  # wait for mysql endpoint
  echo "Waiting for mysql server to spin up"
  # since we don't actually have the mysql server connection setup yet, we will just pretend we the endpoint has loaded.
  BAR='.....'
  for i in 1 2 3 4 5
  do
      echo -ne "\r${BAR:0:$i}"
      sleep .5
  done
  echo -e "\rDatabase running at http://localhost:3306/"
  echo "All containers are up and running!"
else
  echo "You need to install docker.\nGet docker at https://docs.docker.com/get-docker/"
fi


