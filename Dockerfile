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
COPY . .
# install psycopg2 dependencies
RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev postgresql-dev \
    && apk add postgresql-client \
    && pip install wheel \
    && pip install -r requirements.txt \
    && apk del build-deps
CMD python manage.py runserver 0.0.0.0:$PORT