# flask_gateway_template
Base flask web application

A starter template for building a flask application ready to be deployed to google cloud.

This is a minimal flask application for building microservices.

## Tech Stack
The backend server uses flask to implement logic in python for flexibility.

The frontend server uses Bootstrap and flask's jinja engine.

Static assets (css, js, and images) in the `public` directory are deployed separately from the flask web app in the `server` directory.

## Getting started

### Installations
- python
- virtualenv
- pip

### Setting up a virtual environment
Run the following to set up a virutal environment using `virtualenv`
```
pwd # ensure you are at repo root directory
--> starter-template-flask-service
virtualenv template-env # create a virtual environment called "template-env"
source template-env/bin/activate # activate the virtual environment
pip install -r requirements.txt # install python packages
```

## Setting Flask Web Server Locally

### Set up
```
sqlite3 ## have sqlite3 running

export SQLALCHEMY_DATABASE_URI=sqlite://     \
       APP_SETTINGS=config.DevelopmentConfig \
       FLASK_ENV=development

flask run
```


### See `server/README.md` for running Locally

### Deploying
```
firebase deploy
cd server

gcloud builds submit --tag gcr.io/[PROJECT_ID]/flask-gateway-template
gcloud beta run deploy flask-gateway-template --image gcr.io/[PROJECT_ID]/flask-gateway-template --platform=managed --region=us-west1 --ingress=all
```
