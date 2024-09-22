FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD exec uvicorn fastapp:app --host 0.0.0.0 --port $PORT --workers 1 --timeout-keep-alive 300 --log-level debug
