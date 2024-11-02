{ pkgs, config, ... }:
let
  taskFile = pkgs.writeText "taskfile" (builtins.readFile ./Taskfile.yaml);
in
{
  env.TASKFILE_infra = taskFile;

  packages = [
    pkgs.clusterctl
    pkgs.cilium-cli
    pkgs.fluxcd
    pkgs.packer
    pkgs.hcloud
    pkgs.gh
    pkgs.crossplane-cli
  ];
}
