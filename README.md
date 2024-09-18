# Teda Project DevEnv Configurations

This repository contains the devenv configurations used across Teda projects. These configurations help maintain consistency and streamline the development environment setup for various Teda projects.

## Overview

The configurations in this repository are designed to work with [devenv](https://devenv.sh/), a tool for creating reproducible development environments.

## Key Components

1. `.editorconfig`: Defines coding style preferences across different editors and IDEs.
2. `base.nix`: Contains the base configuration for all Teda projects, including common tools and packages.
3. `web.nix`: Specific configuration for web development projects, including JavaScript, TypeScript, and PHP setups.

## Usage

To use these configurations in a Teda project:

Add these files to your project and run `devenv shell`
```yaml
# devenv.yaml
# yaml-language-server: $schema=https://devenv.sh/devenv.schema.json
inputs:
  nixpkgs:
    url: github:NixOS/nixpkgs/nixos-unstable
  pre-commit-hooks:
    url: github:cachix/pre-commit-hooks.nix
  tedatech:
    url: git+ssh://git@github.com/TedaTech/devenv?ref=refs/tags/v1.4.0
    flake: false
imports:
  - tedatech/base.nix
```

```nix
# devenv.nix
{ pkgs, lib, config, inputs, ... }:
{
}
```

## License

[Specify the license here, if applicable]
