# Teda Project DevEnv Configurations

This repository contains the devenv configurations used across Teda projects. These configurations help maintain consistency and streamline the development environment setup for various Teda projects.

## Overview

The configurations in this repository are designed to work with [devenv](https://devenv.sh/), a tool for creating reproducible development environments.

## Usage

To use these configurations in a Teda project:

Add these files to your project and run `devenv shell`
```yaml
# devenv.yaml
# yaml-language-server: $schema=https://devenv.sh/devenv.schema.json
allowUnfree: true
inputs:
    nixpkgs:
        url: github:cachix/devenv-nixpkgs/rolling
    tedatech:
        url: github:TedaTech/devenv/main
        flake: false
imports:
    - tedatech/modules/base
    - tedatech/modules/infra
```

```nix
# devenv.nix
{ pkgs, lib, config, inputs, ... }:
{
}
```
