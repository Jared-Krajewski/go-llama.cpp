# go-llama.cpp
llama.cpp dev boilerplate backend with go api


`make build` - builds ollama-cpp in docker container


*models must be stored in /llama-cpp/models as a gguf*
EX: models/tinyllama.gguf

gguf models can be pulled directly from [HuggingFace](https://huggingface.co/TheBloke/TinyLlama-1.1B-Chat-v1.0-GGUF)



TODO:

- Allow build to check for locally downloaded models and copy then, if they dont exist pull a selected model
- Add a go API wrapper with increased functionality
- Add sqlite
