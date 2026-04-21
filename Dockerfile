FROM ghcr.io/open-webui/open-webui:main

ENV WEBUI_AUTH=False \
    ENABLE_OPENAI_API=True \
    OPENAI_API_BASE_URLS=http://host.docker.internal:12434/engines/llama.cpp/v1 \
    OPENAI_API_KEYS=docker-model-runner \
    DEFAULT_MODELS=ai/gpt-oss

EXPOSE 8080
