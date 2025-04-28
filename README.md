# go-llama.cpp
llama.cpp server dev boilerplate allowing use of multiple models

`make build` - builds ollama-cpp in docker container

*models must be stored in /llama-cpp/models as a gguf*
EX: models/tinyllama.gguf

`make curl-tinyllama` will pull tinyllama into this directory, if tinyllama is not in this directory, it will be pulled when llama.cpp is built

`make curl-llama3.2` will pull llama3.2 into this directory, if llama3.2 is not in this directory, it will be pulled when llama.cpp is built

TODO:

- Add functionality to select LLM during build (and eventually after)
- Add a go API wrapper with increased functionality
- Add sqlite

**Resources**
[llama.cpp server readme](https://github.com/ggml-org/llama.cpp/blob/master/examples/server/README.md)
