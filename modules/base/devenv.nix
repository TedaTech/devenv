{ pkgs, lib, config, inputs, ... }:
let
  clusterName = builtins.hashString "md5" config.env.DEVENV_ROOT;
  taskFile = pkgs.writeText "tedaTaskfile" (builtins.readFile ./Taskfile.yaml);
  kindConfigFile = pkgs.writeText "tedaKindConfig" (builtins.readFile ./kind-config.yaml);
in
{
  env.TEDA_TASK_INFRA = taskFile;
  env.TEDA_KIND_CONFIG = kindConfigFile;

  dotenv.enable = true;

  packages = [
    pkgs.jq
    pkgs.git
    pkgs.kind
    pkgs.kubectl
    pkgs.k9s
    pkgs.kyverno-chainsaw
    pkgs.mkcert
    pkgs.cilium-cli
    pkgs.go-task
    pkgs.telepresence2
    pkgs.tektoncd-cli
    pkgs.fluxcd
    pkgs.envsubst
  ];
}
