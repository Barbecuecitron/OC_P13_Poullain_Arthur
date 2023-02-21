# FROM python:3-alpine
# ENV PORT=8000

# WORKDIR /app
# COPY . .

# RUN adduser --disabled-password --gecos '' myuser

# RUN \ 
#     apk update && \
#     apk add --no-cache --virtual build-deps gcc python3-dev musl-dev postgresql-dev && \
#     apk add --no-cache postgresql-libs && \
# USER myuser

# RUN \
#     python3 -m pip install --upgrade pip && \
#     pip install wheel && \
#     pip install -r requirements.txt && \
#     apk del build-deps
    
# CMD python3 manage.py runserver 0.0.0.0:$PORT

# FROM python:3.9-alpine

# ENV PORT=8000

# WORKDIR /app

# COPY . /app

# RUN \
#     apk update && \
#     apk add --no-cache --virtual build-deps gcc python3-dev musl-dev postgresql-dev && \
#     apk add --no-cache postgresql-libs && \
#     # python3 -m pip install --user--upgrade pip && \
#     python3 -m pip install -r requirements.txt && \
#     apk del build-deps
    
# CMD python manage.py runserver "0.0.0.0:$PORT"
FROM python:3.8.3-alpine

RUN pip install --upgrade pip

RUN adduser -D myuser
WORKDIR /home/myuser

RUN \
    apk update && \
    apk add --no-cache --virtual build-deps gcc python3-dev musl-dev postgresql-dev && \
    apk add --no-cache postgresql-libs

USER myuser


COPY --chown=myuser:myuser requirements.txt requirements.txt

RUN pip install --user -r requirements.txt

ENV PATH="/home/myuser/.local/bin:${PATH}"

COPY --chown=myuser:myuser . .
USER root

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
