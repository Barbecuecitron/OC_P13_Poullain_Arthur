FROM python:3.9-alpine

ENV PORT=8000

WORKDIR /app

COPY . /app

RUN \
    apk update && \
    apk add --no-cache --virtual build-deps gcc python3-dev musl-dev postgresql-dev && \
    apk add --no-cache postgresql-libs && \
    python3 -m venv venv && \
    source venv/bin/activate && \
    python3 -m pip install --upgrade pip && \
    python3 -m pip install wheel && \
    python3 -m pip install -r requirements.txt && \
    apk del build-deps

CMD cd /app && source venv/bin/activate && python manage.py runserver "0.0.0.0:$PORT"
