FROM python:3.7-slim-stretch

RUN apt-get update && apt-get install -y git python3-dev gcc \
    && rm -rf /var/lib/apt/lists/*

COPY floyd_requirements.txt .

RUN pip install --upgrade pip

RUN pip install --no-cache-dir -r floyd_requirements.txt --upgrade

COPY app app/

RUN python app.py

EXPOSE 5042

CMD ["python", "app.py", "serve"]
