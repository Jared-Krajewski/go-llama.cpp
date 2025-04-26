API_DIR=api
LLAMA_DIR=llama-cpp
TOOLS_DIR=tools

help:
	@echo "Available targets:"
	@echo "  build: Build the Docker image and start the container"
	@echo "  copy-model: Copy model files to the container"
	@echo "  create-network: Create a Docker network for the container"
	@echo "  remove-network: Remove the Docker network"
	@echo "  clean: Clean up Docker images and containers"
	@echo "  clobber: Remove all Docker images and containers"
	@echo "  restart: Restart the Docker container"
	@echo "  llama-cpp-start: Start the llama-cpp container"
	@echo "  llama-cpp-stop: Stop the llama-cpp container"
	@echo "  curl-model: Download model gguf from huggigg face"

.PHONY: build copy-model create-network remove-network clean clobber restart llama-cpp-start llama-cpp-stop curl-model

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

curl-model:
	curl -L -o models/tinyllama-q4_0.gguf https://huggingface.co/TheBloke/TinyLlama-1.1B-Chat-v1.0-GGUF/resolve/main/tinyllama-1.1b-chat-v1.0.q4_0.gguf
