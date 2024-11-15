{ pkgs, lib, config, inputs, ... }:
let
  clusterName = builtins.hashString "md5" config.env.DEVENV_ROOT;
  kindConfigFile = pkgs.writeText "tedaKindConfig" (builtins.readFile ./kind-config.yaml);
  taskDir= pkgs.symlinkJoin {
    name = "tedaTaskDir";
    paths = [ ./task ];
  };
in
{
  env.TEDA_TASK_DIR = taskDir;
  env.TEDA_TASK_BASE = "${taskDir}/Taskfile.yaml";
  env.TEDA_KIND_CONFIG = kindConfigFile;
  env.APP_ROOT = config.env.DEVENV_ROOT;

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
    pkgs.skaffold
    pkgs.parallel
  ];
}
