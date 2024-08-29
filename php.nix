{ pkgs, lib, config, inputs, ... }:
{
  languages = {
    php = {
      enable = true;
      version = "8.2";
      extensions = [
        "xdebug"
      ];
      ini = lib.concatStringsSep "\n" [
        "xdebug.mode=debug"
      ];
    };
  };
}
