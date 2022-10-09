#!/bin/bash

if [[ $(which docker) ]]; then
  docker pull team0anana/csc302:backend
  docker pull team0anana/csc302:frontend

  docker run -d -p 5000:5000 --name team0anana-backend team0anana/csc302:backend
  docker run -d -p 3000:3000 --name team0anana-frontend team0anana/csc302:frontend

else
  echo "You need to install docker"
fi

