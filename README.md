# Teda Project DevEnv Configurations

This repository contains the devenv configurations used across Teda projects. These configurations help maintain consistency and streamline the development environment setup for various Teda projects.

## Overview

The configurations in this repository are designed to work with [devenv](https://devenv.sh/), a tool for creating reproducible development environments.

## Key Components

1. `.editorconfig`: Defines coding style preferences across different editors and IDEs.
2. `base.nix`: Contains the base configuration for all Teda projects, including common tools and packages.
3. `web.nix`: Specific configuration for web development projects, including JavaScript, TypeScript, and PHP setups.
4. `.releaserc`: Configuration for semantic-release, used for automated version management and package publishing.
5. `.github/workflows/release.yaml`: GitHub Actions workflow for automated releases.

## Usage

To use these configurations in a Teda project:

1. Clone this repository or copy the relevant files into your project.
2. Ensure you have devenv installed on your system.
3. Customize the configurations as needed for your specific project.
4. Run `devenv up` to set up your development environment.

## Key Features

- Consistent coding styles across projects (via .editorconfig)
- Common development tools pre-configured (git, kubectl, etc.)
- Web development setup with JavaScript, TypeScript, and PHP support
- Automated semantic versioning and release management

## Contributing

If you need to make changes to these configurations, please ensure they are compatible with existing Teda projects and follow the established patterns.

## License

[Specify the license here, if applicable]
