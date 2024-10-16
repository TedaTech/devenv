{ pkgs, lib, config, inputs, ... }:
let
  clusterName = builtins.hashString "md5" config.env.DEVENV_ROOT;
in
{
  dotenv.enable = true;

  packages = [
    pkgs.git
    pkgs.jq
    pkgs.colima
    pkgs.kubectl
    pkgs.k9s
    pkgs.kyverno-chainsaw
    pkgs.just
    pkgs.watchexec
    pkgs.tektoncd-cli
    pkgs.crossplane-cli
    pkgs.mkcert
  ];

  languages = {
    opentofu.enable = true;
  };
}
