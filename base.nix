{ pkgs, lib, config, inputs, ... }:
let
  clusterName = builtins.hashString "md5" config.env.DEVENV_ROOT;
in
{
  packages = [
    pkgs.git
    pkgs.jq
    pkgs.kind
    pkgs.kubectl
    pkgs.k9s
    pkgs.kyverno-chainsaw
    pkgs.just
    pkgs.watchexec
    pkgs.tektoncd-cli
    pkgs.crossplane-cli
  ];

  languages = {
    opentofu.enable = true;
  };
}
