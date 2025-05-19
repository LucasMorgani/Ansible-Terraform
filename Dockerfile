FROM python:3.13.2-alpine3.20

WORKDIR /app

COPY requirements.txt .
COPY app.py .
COPY ./templates/index.html .

RUN pip install --no-cache-dir -r requirements.txt

CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
