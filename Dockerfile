FROM python:3.10.8-slim-bullseye

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1 \
    PORT=10000

RUN apt update && apt install -y --no-install-recommends ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /dotxbrain-bot

COPY requirements.txt .
RUN pip3 install -U pip && pip3 install -U -r requirements.txt

COPY . .

EXPOSE 10000

CMD ["python", "main.py"]
