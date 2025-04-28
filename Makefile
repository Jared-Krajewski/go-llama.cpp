API_DIR=api
MODEL_DIR=$(LLAMA_DIR)/models
LLAMA_DIR=llama-cpp
TOOLS_DIR=tools

help:
	@echo "Available targets:"
	@echo "  build: Build the Docker image and start the container"
	@echo "  copy-model: Copy model files to the container"
	@echo "  create-network: Create a Docker network for the container"
	@echo "  remove-network: Remove the Docker network"
	@echo "  llama-cpp-start: Start the llama-cpp container"
	@echo "  llama-cpp-stop: Stop the llama-cpp container"
	@echo "  clean: Clean up Docker images and containers"
	@echo "  clobber: Remove all Docker images and containers"
	@echo "  restart: Restart the Docker container"
	@echo "  curl-tinyllama: Download the TinyLlama GGUF model"
	@echo "  curl-llama3.2: Download the Llama 3.2 GGUF model"

.PHONY: build create-network remove-network llama-cpp-start llama-cpp-stop clean clobber restart curl-tinyllama curl-llama3.2

build:
	@$(MAKE) llama-cpp-start

create-network:
	docker network create llama-net || true

remove-network:
	docker network rm llama-net || true

llama-cpp-start: create-network
	cd $(LLAMA_DIR) && docker compose up -d

llama-cpp-stop:
	cd $(LLAMA_DIR) && docker compose down -v

clean:
	cd $(TOOLS_DIR); chmod +x ./clean-docker.sh; ./clean-docker.sh

clobber:
	cd $(TOOLS_DIR); chmod +x ./clobber-docker.sh; ./clobber-docker.sh

restart: llama-cpp-stop remove-network create-network llama-cpp-start

curl-tinyllama:
	MODEL_FILE=$(MODEL_DIR)/tinyllama.gguf; \
	MODEL_URL="https://huggingface.co/TheBloke/TinyLlama-1.1B-Chat-v1.0-GGUF/resolve/main/tinyllama-1.1b-chat-v1.0.Q4_K_S.gguf"; \
	if [ ! -f "$$MODEL_FILE" ]; then \
		echo "Downloading TinyLlama GGUF..."; \
		curl -L -o "$$MODEL_FILE" "$$MODEL_URL"; \
	else \
		echo "TinyLlama GGUF already exists at $$MODEL_FILE."; \
	fi

curl-llama3.2:
	MODEL_FILE=$(MODEL_DIR)/llama3.2.gguf; \
	MODEL_URL="https://huggingface.co/lmstudio-community/Llama-3.2-3B-Instruct-GGUF/resolve/main/Llama-3.2-3B-Instruct-Q4_K_M.gguf"; \
	if [ ! -f "$$MODEL_FILE" ]; then \
		echo "Downloading llama3.2 GGUF..."; \
		curl -L -o "$$MODEL_FILE" "$$MODEL_URL"; \
	else \
		echo "llama3.2 GGUF already exists at $$MODEL_FILE."; \
	fi
