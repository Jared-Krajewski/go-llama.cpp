#!/bin/bash
set -e

MODEL_PATH="/models/tinyllama.gguf"

# Check if model exists, if not download it
if [ -f "$MODEL_PATH" ]; then
    echo "✅ Model found at $MODEL_PATH"
else
    echo "❌ Model not found. Downloading from Hugging Face..."
    curl -L -o "$MODEL_PATH" https://huggingface.co/TheBloke/TinyLlama-1.1B-Chat-v1.0-GGUF/resolve/main/tinyllama-1.1b-chat-v1.0.Q2_K.gguf

fi

echo "🚀 Starting llama-server with model: $MODEL_PATH"
exec /app/llama-server --host 0.0.0.0 --port 11435 -m "$MODEL_PATH"
