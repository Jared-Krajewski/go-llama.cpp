FROM ghcr.io/ggerganov/llama.cpp:server

COPY ./models /models

EXPOSE 11435

CMD ["--host", "0.0.0.0", "--port", "11435", "-m", "/models/tinyllama.gguf"]
