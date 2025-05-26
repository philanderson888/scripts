# syntax=docker/dockerfile:1
FROM python:3.10-alpine
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
# flash is running on port 5000 but map this internally to port 9000 externally which is visible in localhost:9000
EXPOSE 9003
COPY . .
CMD ["flask", "run", "--debug"]