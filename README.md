# docker-ai-compose-example-chat

This is an example of using Docker Model Runner with Open WebUI ("Bill's WebUI") for a chat interface. Docker Model Runner is defined as a native Compose service using the `model` provider type.

## Prerequisites

- Docker Desktop with the Docker Model Runner feature enabled

## Run with Docker Compose

```bash
docker compose up
```

Then open `http://localhost:3000`.

## Services

### `webui`

Runs [Open WebUI](https://github.com/open-webui/open-webui) on port `3000`, pre-configured to connect to Docker Model Runner through Docker Desktop's internal Model Runner DNS endpoint.

| Environment Variable | Value |
|---|---|
| `OPENAI_API_BASE_URLS` | `http://model-runner.docker.internal/engines/v1` |
| `OPENAI_API_KEYS` | *(empty — no auth required)* |
| `WEBUI_NAME` | `Bill's WebUI` |

WebUI data is persisted in the `open-webui-data` named volume.

### `docker-model-runner`

A native Compose service backed by the Docker Model Runner `model` provider.

| Option | Value |
|---|---|
| `model` | `ai/gpt-oss` |

## Basic OpenAI client example

You can also query Docker Model Runner directly using the OpenAI-compatible API from your host:

```python
from openai import OpenAI

client = OpenAI(
    base_url="http://localhost:12434/engines/v1",
    api_key="ignored",  # any non-empty value; auth is not required
)

response = client.chat.completions.create(
    model="ai/gpt-oss",
    messages=[
        {"role": "system", "content": "You are a helpful assistant."},
        {"role": "user", "content": "Say hello from Docker Model Runner."},
    ],
)

print(response.choices[0].message.content)
```
