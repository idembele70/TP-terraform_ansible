### Build my Dockerfile
docker build -t tp .

### run the bash command in the docker container to debug
docker run -it --rm tp bash

### run in non interactive mode
docker run --rm -v $(pwd):/app tp



