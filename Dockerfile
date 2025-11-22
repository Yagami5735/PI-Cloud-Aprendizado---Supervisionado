FROM python:3.11-slim

ENV DEBIAN_FRONTEND=noninteractive

ENV PYTHONUNBUFFERED=1

ENV PYTHONPATH=/app

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    libfreetype6-dev \
    libpng-dev \
    libjpeg-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

COPY backend/requirements.txt .

RUN pip install --no-cache-dir --upgrade pip

RUN pip install --no-cache-dir -r requirements.txt

COPY backend/ /app/

COPY frontend/ /app/frontend/

RUN mkdir -p /app/uploads

ENV PORT=8000

EXPOSE 8000

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]