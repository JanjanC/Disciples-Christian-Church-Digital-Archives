# Disciples Christian Church - Digital Archives

Build Status: [![DLSU-STSWENG-Team-Heroku](https://circleci.com/gh/DLSU-STSWENG-Team-Heroku/STSWENG-Heroku.svg?style=svg)](https://circleci.com/gh/DLSU-STSWENG-Team-Heroku/STSWENG-Heroku)

## Project Information

Stores records for The Disciples Christians Church, provides data visualizations to assist business processes, and allows member registration.

_This project is in partial fullfilment of the requiremenets in the course Advanced Software Engineering (STSWENG)._

## Project Team

-   Scrum Master and Product Owner: **Benedict Sun**
-   Developers: **Adriel Amoguis, Amos Cacha, Aaron Uson**
-   Designer: **Chadi Turk**
-   Quality Assurance: **John Vincent Chua, John Bainto**

## Instructions

### Cloning the Application

For development work on the application, clone the codebase from Github:

```
git clone https://github.com/DLSU-STSWENG-Team-Heroku/STSWENG-Heroku.git
```

### Prerequisites

Before starting the application, a hosted MySQL database instance must be set and environment variables have to be prepared.

Assuming we have a MySQL instance running on `dcc.mysqlexample.net` on port `3306` named `dcc` with the credentials `dccstsweng` for the username and `Password1` for the password, we have to also ensure that the user that we intend to use with the application has full read and write permissions to the assigned database. Additionally, we also need to define the environment and ports to use.

The finished development `.env` should look like this:

```
PORT=3000
COOKIE_SECRET=SECURE_SHA_SECRET
DB_NAME=dcc
DB_USER=dccstsweng
DB_HOST=dcc.mysqlexample.net
DB_PASS=Password1
NODE_ENV=development
```

Ensure that the `.env` file is in the same directory as the `app.js` file.

### Initializing the Database

Once a database is assigned to the application, initialize it by running:

```
npm run initdb
```

This script will add the three default level accounts.

### Running the Application

There are primarily two ways to start the application as seen below:

```
# Run with Node
npm start

# Run with Nodemon
npm run dev
```

The first one runs the application just by using Node, which will not watch for changes. The second one uses Nodemon as a devDependency to watch for any file changes in the repository and restarts the application automatically as you save your progress.

### Running the Unit Tests

The unit tests using JestJS and SinonJS can be invoked by the following command:

```
npm test
```

If you are developing unit tests and want to see verbose logs with file watch, use the following command:

```
npm run testDev
```

If you are having open-handles issues with the unit tests, run:

```
npm run testOpenHandles
```

### Running the Automation Tests

The automation tests are done with Robot Framework using the SeleniumLibrary. It can be invoked with the following command:

```
npm run automationtest
```

Setup and installation of Robot Framework and the SeleniumLibrary is not included in this README. Automation tests take more than an hour to complete.

### Deployment

This repository is set-up with a CI/CD provider which is **CircleCI**. To know more, check the CI/CD portion of this README.

On the deployment server, the following environment variables must be set:

```
PORT=443
HTTP_PORT=80
HTTPS_PORT=443
COOKIE_SECRET=SECURE_SHA_SECRET
DB_NAME=dcc
DB_USER=dccstsweng_production
DB_HOST=dcc.mysqlexample.net
DB_PASS=Password1
NODE_ENV=production
```

The production version of the application will attempt to use port 443 for SSL. With this, code from `app.js` will search for SSL certificates located in `./ssl`. It will need both `privkey.pem` and `cert.pem`. In a production environment, ensure that these certificates are present. If they are not, it is highly recommended to run the application with `NODE_ENV=staging` instead.

Once all that is complete, the server can now be started with:

```
npm start
```

### Containerization

There is a Dockerfile that is set-up in this repository. Use that Dockerfile in conjunction with the following instructions.

First, once the application is ready for building, build the image with the following command:

```
docker build -t $IMAGE_NAME:latest .
```

This will use the Dockerfile in the current directory for its build instructions. Once the image is finished building, it should be pushed to the container registry of your choice. For this example, this is default DockerHub.

```
echo "$DOCKERHUB_PASS" | docker login -u "$DOCKERHUB_USERNAME" --password-stdin
docker push $IMAGE_NAME:latest
```

Once it has been pushed to the container registry, it is now ready for deployment on the deployment server. Two things must be set-up on the deployment server before starting the Docker container. First, create a file called `production.env` (though the filename does not matter) containing the production/deployment environment variables described above. Second, SSL certificates (or a symbolic link to them) must be in a folder called `ssl`. Here is a walkthrough of the series of steps needed to achieve this on an Ubuntu server:

```
# Create the project directory (optional)
$ mkdir dcc-deployment
$ cd dcc-deployment

# Create the .env file
$ nano production.env

# Prepare SSL certificates (assumes that the domain name is: dcc-archives.net)
# Please note that SSL setup differs per machine/OS. Let's Encrypt's Certbot is used in this example.
$ sudo certbot certonly --standalone

# Copy the SSL certificates (or symb links) to the ssl directory
$ mkdir ssl
$ cd ssl
$ cp /etc/letsencrypt/live/dcc-archives.net/privkey.pem ./ssl/privkey.pem
$ cp /etc/letsencrypt/live/dcc-archives.net/cert.pem ./ssl/cert.pem
$ cd ..
```

At this point, your directory structure must look like this:

```
- dcc-deployment/
    - production.env
    - ssl/
        - privkey.pem
        - cert.pem
```

The last steps are now to pull the Docker image and run it in a Docker container. To make this process quicker for future revisits, we shall place it in a script file (Unix bash sh) that is reusable so we can run it every re-deployment.

```
$ nano deploy.sh
```

Copy the following into the script file:

```
#!/bin/bash

# Kill Docker Container
docker kill dcc-production

# Remove Docker Container
docker container rm dcc-production

# Pull Production Docker Image
docker pull DOCKERHUBACCT/IMAGENAME:latest

# Run Docker Image and Inject Environment Variables
docker run -d -p 443:443 -p 80:80 --env-file ./production.env -v /home/dcc-deployment/ssl/:/usr/src/app/ssl/ --name dcc-production DOCKERHUBACCT/IMAGENAME:latest
```

The in-line comments explain what each line is for but to further explain:

-   `docker kill dcc-production`: This line kills an existing container of the name that we are using.
-   `docker container dcc-production`: This line removes the container of the name that we are using.
-   `docker pull DOCKERHUBACCT/IMAGENAME:latest`: This line pulls that Docker image that we pushed to Dockerhub earlier.
-   `docker run -d -p 443:443 -p 80:80 --env-file ./production.env -v /home/dcc-deployment/ssl/:/usr/src/app/ssl/ --name dcc-production DOCKERHUBACCT/IMAGENAME:latest`
    -   `-p`: These represent the port mappings. Port 443 on the container is mapped to port 443 of the deployment server, making 443 accessible to it. Same with 80.
    -   `--env-file`: We are injecting the contents of `production.env` and making them into environment variables for the container, allowing the app to access them.
    -   `-v`: This mounts the ssl directory on the deployment server to `app/ssl` in the container, allowing the application to access the SSL certificates.
    -   `--name`: This allows us to give a name to our container, allowing us to kill it and remove it when re-deploying.
    -   `DOCKERHUBACCT/IMAGENAME:latest`: This is the image that was pulled just earlier and will be used to run the container.

And to the last preparation step, allow executable permissions to the script:

```
$ chmod u+x deploy.sh
```

Finally, to deploy (or re-deploy), simply run the `deploy.sh` script.

```
$ ./deploy.sh
```

## Continuous Integration and Deployment

CI/CD services are provided by **CircleCI**. You may refer [here](./.circleci/config.yml) to view the CI configuration.

### Pipeline

1. Branch Commit Pipeline

    - Commit to any branch except `staging` and `main`:
        - Run all unit tests under the `__tests__` directory.

2. Staging Commit Pipeline

    - Commit to `staging`:
        - Run all unit tests under the `__tests__` directory.
        - Build a staging Docker image and push it to [Dockerhub](https://hub.docker.com/repository/docker/adrielamoguis/stsweng-heroku-dcc/general)
        - Pull the Docker image to Heroku dyno and run it in a staging environment (`NODE_ENV=staging`)

3. Production/main Commit Pipeline

    - Commit to `main`:
        - Run all unit tests under the `__tests__` directory.
        - Build a production Docker image and push it to [Dockerhub](https://hub.docker.com/repository/docker/adrielamoguis/stsweng-heroku-dcc-production/general)
        - Pull the Docker image to DigitalOcean droplet (Ubuntu Bash) and run it in a production environment (`NODE_ENV=production`)
            - The CI deploys to the deployment server like how it was described under the _Containerization_ section above.
            - The deployment server deploys the application here: [https://server.adrielamoguis.com](https://server.adrielamoguis.com)
