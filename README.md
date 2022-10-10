# Writeup
 
[The writeup can be found at here](https://docs.google.com/document/d/13oWfhbKjyR-rqHgePtYeOm5C5SETE_u0oMiI64eTn2M/edit?usp=sharing)
 
# Prerequisites 
 
* Be in a modern linux system 
* Have docker installed - [get docker here](https://docs.docker.com/get-docker/)
* No service is running on ports 3000, 4000, and 5000
 
# Guide on starting the servers
 
The command below will start three containers. The first one is hosting the backend server that runs the Flask application. The first one is hosting a React server, and the last one is hosting the MySQL server.    
 
`sudo ./startup.sh`
 
Notice that the above command expects the user to have Docker installed locally. If this is not the case, the script will not proceed to starting the containers and will prompt the user to install Docker. Once you have Docker installed, you will need to run the above command again.
 
Once the container is up and running and the applications have started on containers, you can reach following endpoints:
* localhost:3000: This endpoint reaches the boilerplate React application. 
* localhost:4000: This endpoint reaches the MySQL database. At this point, the database does not have anything in it.
* localhost:5000: This endpoint reaches the Flask application. At this point, only the "/hello" route is available for GET requests, and returns "Hello, World!"