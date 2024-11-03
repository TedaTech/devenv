{ pkgs, lib, config, inputs, ... }:
{
  packages = [
    pkgs.crossplane-cli
  ];

  languages = {
    go = {
      # Enabled would be better,* not possible du to go 1.23 requirement
      # @see https://github.com/cachix/devenv/issues/1568
      enable = false;
    };
  };
}
