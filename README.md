# docker-ai-compose-example-chat

This is an example of using Docker Model Runner with Open WebUI for a chat interface.

## Run with Docker Compose

```bash
docker compose up --build
```

Then open `http://localhost:3000`.

Default model configuration:

- Model: `ai/gpt-oss`
- OpenAI-compatible API base URL: `http://host.docker.internal:12434/engines/llama.cpp/v1`

## Basic OpenAI client example (Docker Model Runner)

```python
from openai import OpenAI

client = OpenAI(
    base_url="http://localhost:12434/engines/llama.cpp/v1",
    api_key="docker-model-runner",  # any non-empty value
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
