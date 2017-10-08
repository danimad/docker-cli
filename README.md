# Docker environment for various CLI tools

## Info

The Docker image is based on  Jeroen Janssens' [Data Science at the Command Line Docker image.][ds-cli]

## Usage

    docker build -t <container-name> .

    docker run -t -i <container-name> /bin/zsh

## License

I kept the BSD 2-Clause license of the [original repo.][ds-cli-github]

[ds-cli]: https://hub.docker.com/r/datascienceworkshops/data-science-at-the-command-line/
[ds-cli-github]: https://github.com/jeroenjanssens/data-science-at-the-command-line
