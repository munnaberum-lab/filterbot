FROM python:3.10-slim-bookworm

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1 \
    PORT=10000

RUN apt-get update && apt-get install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /dotxbrain-bot

COPY requirements.txt .
RUN pip install -U pip && pip install -r requirements.txt

COPY . .

EXPOSE 10000

CMD ["python", "bot.py"]
