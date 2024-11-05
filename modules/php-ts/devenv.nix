{ pkgs, lib, config, inputs, ... }:
{
  packages = [
    pkgs.symfony-cli
  ];

  languages = {
    javascript = {
      enable = true;
      npm.enable = true;
    };
    typescript = {
      enable = true;
    };
    php = {
      enable = true;
      extensions = [
        "xdebug"
        "xsl"
      ];
      ini = lib.concatStringsSep "\n" [
        "xdebug.mode=debug"
      ];
    };
  };
}
