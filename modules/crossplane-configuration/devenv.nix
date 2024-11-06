{ pkgs, lib, config, inputs, ... }:
let
  taskFile = pkgs.writeText "tedaTaskfile" (builtins.readFile ./Taskfile.yaml);
in
{
  env.TEDA_TASK_CROSSPLANE = taskFile;

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
