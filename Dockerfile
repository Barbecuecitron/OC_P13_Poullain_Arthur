# FROM python:3-alpine
# ENV PORT=8000

# WORKDIR /app
# COPY . .
# # install psycopg2 dependencies
# RUN apk update
# RUN apk add postgresql-dev gcc python3-dev musl-dev
# RUN python -m venv env
# RUN . env/bin/activate
# RUN pip install -r requirements.txt
# CMD python manage.py runserver 0.0.0.0:$PORT
# FROM python:3.9-alpine
# ENV PORT=8000

# WORKDIR /app
# COPY . .
# # install system dependencies
# RUN apk add --no-cache postgresql-libs postgresql-dev build-base
# # create virtual environment and install dependencies
# RUN python -m venv env
# RUN /bin/sh -c "source env/bin/activate && pip install --no-cache-dir -r requirements.txt"
# CMD /bin/sh -c "/app/env/bin/python manage.py runserver 0.0.0.0:$PORT"
# Base image
# FROM python:3.9-alpine

# # Set working directory
# WORKDIR /app

# # Copy application files
# COPY . .

# # Install dependencies
# RUN python3 -m venv venv
# RUN . venv/bin/activate && \
#     pip install --upgrade pip && \
#     pip install -r requirements.txt

# # Expose port
# EXPOSE 8000

# # Run the application
# CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app"]

FROM python:3-alpine
ENV PORT=8000

WORKDIR /app
COPY . .
RUN \
  apk add --no-cache postgresql-libs && \
  apk add --no-cache --virtual .build-deps gcc musl-dev postgresql-dev && \
  python3 -m pip install -r requirements.txt --no-cache-dir && \
  apk --purge del .build-deps && \
  python3 manage.py collectstatic --noinput --clear && \
  python3 manage.py dumpdata -o data.json
  
CMD python3 manage.py runserver 0.0.0.0:$PORT