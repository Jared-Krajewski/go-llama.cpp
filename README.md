# go-llama.cpp
llama.cpp dev boilerplate backend with go api

`make build` - builds ollama-cpp in docker container



*models must be stored in /llama-cpp/models as a gguf*
EX: models/tinyllama.gguf

`make curl` will pull tinyllama into this directory, if tinyllama is not in this directory, it will be pulled one llama.cpp is built

gguf models can be pulled directly from [HuggingFace](https://huggingface.co/TheBloke/TinyLlama-1.1B-Chat-v1.0-GGUF)



TODO:

- Add functionality to select LLM during build (and eventually after)
- Add a go API wrapper with increased functionality
- Add sqlite
