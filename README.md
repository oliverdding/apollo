# apollo

Development environment based on fedora docker image

[go1.15, java8, scala2.11, scala2.12, sbt1.13, gcc11, rust1.58-nightly]

## Usage

1. Prepare all your configurations
  - ~/.ssh
  - ~/.gpg
  - ~/.config/git
  - ~/.config/nvim
2. Put your project in ~/Developer
3. Register your project in a docker-compose file on the given template [docker-compose.yaml](./docker-compose.yaml)
4. Start the container && Use VSCode with Visual Studio Code Remote - Containers to attach the container
