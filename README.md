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
3. `docker-compose up -d docker-compose.yaml apollo`
4. Use VSCode with Visual Studio Code Remote - Containers to attach the container
