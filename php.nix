{ pkgs, lib, config, inputs, ... }:
{
  packages = [
    pkgs.symfony-cli
  ];

  languages = {
    php = {
      enable = true;
      extensions = [
        "xdebug"
      ];
      ini = lib.concatStringsSep "\n" [
        "xdebug.mode=debug"
      ];
    };
  };
}
