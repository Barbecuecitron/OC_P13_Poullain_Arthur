FROM python:3-alpine
ENV PORT=8000

WORKDIR /app
COPY . .

RUN adduser --disabled-password --gecos '' myuser
USER myuser

RUN \ 
    apk update && \
    apk add --no-cache --virtual build-deps gcc python3-dev musl-dev postgresql-dev && \
    apk add --no-cache postgresql-libs && \

RUN \
    python3 -m pip install --upgrade pip && \
    pip install wheel && \
    pip install -r requirements.txt && \
    apk del build-deps
    
CMD python3 manage.py runserver 0.0.0.0:$PORT