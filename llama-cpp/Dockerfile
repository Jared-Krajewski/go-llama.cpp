FROM ghcr.io/ggerganov/llama.cpp:server

COPY ./models /models
COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 11435

ENTRYPOINT ["/entrypoint.sh"]
