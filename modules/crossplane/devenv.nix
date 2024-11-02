{ pkgs, lib, config, inputs, ... }:
{
  packages = [
    pkgs.crossplane-cli
  ];

  languages = {
    go = {
      enable = true;
    };
  };
}
