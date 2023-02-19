# FROM python:3-alpine
# ENV PORT=8000

# WORKDIR /app
# COPY . .
# RUN apk update && \
#     apk add --no-cache --virtual build-deps gcc python3-dev musl-dev postgresql-dev && \
#     # python3 -m venv venv && \
#     # . venv/bin/activate && \
#     apk add --no-cache postgresql-libs && \
#     python3 -m pip install --upgrade pip && \
#     pip install wheel && \
#     pip install -r requirements.txt && \
#     apk del build-deps
    
# CMD python3 manage.py runserver 0.0.0.0:$PORT

FROM python:3-alpine

# create a non-root user and switch to that user
RUN adduser -D myuser
USER myuser

# set the environment variables
ENV PORT=8000
ENV HOME=/home/myuser

# set the working directory
WORKDIR $HOME/app

# change the ownership of the working directory to the non-root user
RUN sudo chown -R myuser:myuser $HOME/app

# copy the app files
COPY . $HOME/app

# install dependencies
RUN apk update && \
    apk add --no-cache --virtual build-deps gcc python3-dev musl-dev postgresql-dev && \
    apk add --no-cache postgresql-libs && \
    python3 -m pip install --user --upgrade pip && \
    pip install --user wheel && \
    pip install --user -r requirements.txt && \
    apk del build-deps

# start the server
CMD python3 manage.py runserver 0.0.0.0:$PORT