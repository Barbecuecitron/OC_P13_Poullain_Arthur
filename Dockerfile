FROM python:3-alpine
ENV PORT=8000

# Create a non-root user
RUN adduser -D appuser

WORKDIR /app
COPY . .

# Install psycopg2 dependencies
RUN apk update && \
    apk add --no-cache postgresql-dev gcc python3-dev musl-dev && \
    python3 -m venv venv && \
    /bin/sh -c ". venv/bin/activate && pip install -r requirements.txt"

# Set ownership to the non-root user
RUN chown -R appuser /app

USER appuser
CMD python manage.py runserver 0.0.0.0:$PORT
