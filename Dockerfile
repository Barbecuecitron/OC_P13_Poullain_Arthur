# FROM python:3-alpine
# ENV PORT=8000

# WORKDIR /app
# COPY . .
# # install psycopg2 dependencies
# RUN apk update
# RUN apk add postgresql-dev gcc python3-dev musl-dev
# RUN pip install -r requirements.txt
# CMD python manage.py runserver 0.0.0.0:$PORT
FROM python:3-alpine

ENV PORT=8000

WORKDIR /app

# copy requirements and install dependencies
COPY requirements.txt .
RUN apk update \
    && apk add postgresql-dev gcc python3-dev musl-dev \
    && python -m venv /venv \
    && source /venv/bin/activate \
    && pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# copy the rest of the code
COPY . .

# set the working directory and run the application
WORKDIR /app
CMD source /venv/bin/activate && python manage.py runserver 0.0.0.0:$POR