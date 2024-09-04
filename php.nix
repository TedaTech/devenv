{ pkgs, lib, config, inputs, ... }:
{
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
