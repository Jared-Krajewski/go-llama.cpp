API_DIR=api
LLAMA_DIR=llama-cpp
TOOLS_DIR=tools

.PHONY: build copy-model create-network remove-network clean clobber restart llama-cpp-start llama-cpp-stop

# TODO: build will attempt to copy models from host, if not available it will pull them
build:
	@$(MAKE) llama-cpp-start
	@$(MAKE) api-start

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
