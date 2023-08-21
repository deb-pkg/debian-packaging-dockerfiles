# Docker Setup for Debian Packaging Development

This repository contains a Docker setup for facilitating Debian packaging development. It includes configurations for containers/

## Prerequisites

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Usage

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/deb-pkg/debian-packaging-dockerfiles.git
   cd debian-packaging-dockerfiles
   ```

2. Set environment variables:

   Copy the `.env.example` to `.env` file in the root directory of the repository and set the following variables:

   ```plaintext
   EMAIL=your.email@example.com
   FULLNAME="Your Full Name"
   ```

3. Build and run the Docker containers:

   ```bash
   docker-compose -f docker-compose.go-debian-dev.yml up -d --build go-debian-dev
   ```

4. Enter the `debian-packaging` container:

   ```bash
   docker exec -it go-debian-dev bash
   ```

   You will be inside the container with tools and environment set up for Debian packaging development.

5. Build your Debian packages:

   Inside the `debian-packaging` container, navigate to your package directory and run `debuild` to build your Debian packages.

6. Clean up:

   When you're done, you can stop and remove the containers using:

   ```bash
   docker-compose down
   ```

## Customization

- Adjust the environment variables in the `.env` file to match your preferences.
- Customize the `Dockerfile` and `docker-compose.yml` to add or modify packages and configurations according to your needs.

## Contributing

Feel free to contribute to this repository by opening issues or pull requests. Your feedback and improvements are welcome!

## License

This project is licensed under the [MIT License](LICENSE).
