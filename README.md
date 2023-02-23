# OC_P13_Poullain_Arthur
Python version used : Python 3.7.9

Mise à l'échelle d'une application Django en utilisant une architecture modulaire

# Installation guide :
* Install Python3.7.9 : ```$ sudo apt install python3.7.9```
* Install the pip package if you don't have it : ``` $ sudo apt install python3-pip ```
* Clone the Repository : ```$ git clone https://github.com/Barbecuecitron/OC_P13_Poullain_Arthur.git ```

# How to use ?
* ```cd /path/to/Project``` navigate to the project dir
* ```python -m venv venv``` create the virtual env
* ```venv\Scripts\activate``` activate the virtual env 

# Create the ENV variables in a .env file
* Your .env file should contain these variables:
```
ENV_DJANGO_SECRET_KEY=XXXX
HEROKU_APP_NAME=XXXXX
HEROKU_API_KEY=XXXXX
DOCKERHUB_LOGIN=XXXXX
DOCKERHUB_PASSWORD=XXXXX
DOCKER_REPOSITORY=XXXXX
SENTRY_DSN=XXXXX
SENTRY_AUTH_TOKEN=XXXXX
```

# Run & Browse the app locally
* ```cd /path/to/Project``` navigate to the project dir
* ```venv\Scripts\activate``` activate the virtual env 
* ``` python manage.py migrate ``` apply migrations on database
* ```python manage.py loaddata data.json``` load dataset from json fixture
* ```python manage.py runserver``` run the server locally
* Visit http://localhost:8000/

--
# Execute linting and tests
* From within the virtual environnment,  you can execute the linting by running ```flake8```
* From within the virtual environnment, you can execute the tests by running ```pytest```

# Adding Docker Support
Since the .Dockerfile contains every needed informations to build the image, you can deploy the app using the following steps :

* 1 - Clone the project and setup the local environnment as shown in the previouses steps.

* 2 - Setup a new CircleCI project with the master /  main branch as the root.

* 3 - Setup the CircleCI env vars to match the ones you previously created.

* 4 - Create a Docker repository from DockerHub - don't forget to add it as a CircleCI env var.```DOCKER_REPOSITORY=your_docker_repo_name```

# Setting up Heroku for deployment
* 1 - Create a heroku app

* 2 - Install the Heroku Postgres addon on your Heroku Project.

* 3 - Add these env_vars to your CircleCI project : ```HEROKU_APP_NAME=your_heroku_app_name``` & ```HEROKU_API_KEY=your_heroku_api_key```

# Adding Sentry monitoring
You can allow Sentry to monitor your server's behavior by setting the SENTRY_DSN to your env_vars (CircleCI && .env)

# Contributors
* Arthur P