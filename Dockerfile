# FROM python:3-alpine
# ENV PORT=8000

# WORKDIR /app
# COPY . .
# # install psycopg2 dependencies
# RUN python -m venv env
# RUN . env/bin/activate
# RUN apk update
# RUN apk add postgresql-dev gcc python3-dev musl-dev
# RUN pip install -r requirements.txt
# CMD python manage.py runserver 0.0.0.0:$PORT
FROM python:3.9-alpine
ENV PORT=8000

WORKDIR /app
COPY . .
# install system dependencies
RUN apk add --no-cache postgresql-libs postgresql-dev build-base
# create virtual environment and install dependencies
RUN python -m venv env
RUN /bin/sh -c "source env/bin/activate && pip install --no-cache-dir -r requirements.txt"
# CMD /bin/sh -c "source env/bin/python manage.py runserver 0.0.0.0:$PORT" 
CMD /bin/sh -c "/app/env/bin/python manage.py runserver 0.0.0.0:$PORT"
#&& python manage.py runserver 0.0.0.0:$PORT"

# FROM python:3-alpine
# ENV PORT=8000

# WORKDIR /app
# COPY . .
# RUN apk update && \
#     apk add --no-cache --virtual build-deps gcc python3-dev musl-dev postgresql-dev && \
#     python3 -m venv venv && \
#     . venv/bin/activate && \
#     pip install wheel && \
#     pip install -r requirements.txt && \
#     apk del build-deps
# CMD python manage.py runserver 0.0.0.0:$PORT