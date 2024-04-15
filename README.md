# Shopify CLI 3.0 Containerized

This project simplifies running Shopify CLI 3.0 across different systems by using Docker, addressing compatibility issues and providing a consistent environment.

## Features

- Uniform Shopify CLI experience on any system
- Easy setup with Docker
- Runs on multiple operating systems
- Don't need to install specific version dependencies like Ruby and Node

## Prerequisites

Ensure Docker is installed:
- `Install Docker` https://docs.docker.com/get-docker/


## Installation

Clone and build the project:


```bash
git clone https://github.com/yourusername/shopify-cli-container.git

cd shopify-cli-container
```


## Usage

Run Shopify CLI with:


```bash
docker-compose run --build shopify-cli shopify theme pull

docker-compose run --build shopify-cli shopify theme dev

docker-compose run --build shopify-cli shopify theme publish # NOTE: UNTESTED still

```


### Common Commands

- Start a new Shopify theme:

```bash
docker-compose run shopify-cli shopify theme init
```


- Pull a theme from a Shopify store:

```bash
docker-compose run shopify-cli shopify theme pull
```


## Contributing

Contributions are welcome. Please fork the project, create a feature branch, commit your changes, push to the branch, and open a pull request.

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contact

Project Link: https://github.com/StevenPartridge/dockerized-shopify-cli

