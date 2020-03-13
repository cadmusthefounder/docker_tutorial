FROM python:3.7-slim as base-image
ENV VENV_PATH=/venv

FROM base-image as build-image

RUN apt-get update \
    && apt-get install -y \
    build-essential \
    libpq-dev \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/* \
    && python -m venv $VENV_PATH \
    && $VENV_PATH/bin/pip install --no-cache-dir --upgrade pip

WORKDIR /app

COPY requirements.txt .
RUN $VENV_PATH/bin/pip install --no-cache-dir -r requirements.txt

FROM base-image as runtime-image

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY --from=build-image $VENV_PATH $VENV_PATH
ENV PATH="$VENV_PATH/bin:$PATH"

COPY . .

RUN groupadd -r app && useradd -r -s /bin/false -g app app \
    && chown -R app:app /app
USER app

EXPOSE 8080
CMD ["python", "src/app.py"]