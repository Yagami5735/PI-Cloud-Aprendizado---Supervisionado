FROM python:3.11-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=/app

WORKDIR /app

# Instala dependências do sistema operacional
RUN apt-get update && apt-get install -y \
    build-essential \
    libfreetype6-dev \
    libpng-dev \
    libjpeg-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# 1. Copia o requirements.txt da pasta backend para a raiz do container
COPY backend/requirements.txt .

# 2. Instala as bibliotecas Python
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# 3. A MÁGICA: Copia o CONTEÚDO de backend para a raiz do container (/app)
# Isso significa que o arquivo app.py vai ficar solto em /app/app.py
COPY backend/ /app/

# 4. Copia a pasta frontend para /app/frontend
COPY frontend/ /app/frontend/

# Cria pasta de uploads para evitar erro de permissão
RUN mkdir -p /app/uploads

# Configura a porta
ENV PORT=8000
EXPOSE 8000

# Comando de Início
# Como copiamos o conteúdo de backend para a raiz (/app), o uvicorn acha o app.py direto
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]