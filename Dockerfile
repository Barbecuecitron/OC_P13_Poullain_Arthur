FROM python:3-alpine
WORKDIR /app
COPY . .
# install psycopg2 dependencies
RUN apk update
RUN apk add postgresql-dev gcc python3-dev musl-dev
RUN pip install -r requirements.txt
CMD python manage.py runserver 
