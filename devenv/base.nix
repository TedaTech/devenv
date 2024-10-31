{ pkgs, lib, config, inputs, ... }:
let
  clusterName = builtins.hashString "md5" config.env.DEVENV_ROOT;
in
{
  dotenv.enable = true;

  packages = [
    pkgs.git
    pkgs.jq
    pkgs.kind
    pkgs.kubectl
    pkgs.k9s
    pkgs.kyverno-chainsaw
    pkgs.watchexec
    pkgs.mkcert
    pkgs.cilium-cli
    pkgs.go-task
  ];
}
