# python 3.7 base image
FROM python:3.7

# create copy of src into /app to run
COPY src/ /app
WORKDIR /app

# install app requirements
COPY requirements.txt /app
RUN apt-get update && \
    apt-get install -y postgresql libpq-dev && \
    pip install --upgrade pip && pip install -r requirements.txt

# set PORT to handle requests
ENV PORT 8080 \
    APP_SETTINGS="config.ProductionConfig" \
    SQLALCHEMY_DATABASE_URI="sqlite://"



# run flask app using gunicorn
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 app:app
