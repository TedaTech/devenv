{ pkgs, lib, config, inputs, ... }:
let
  colimaProfile = builtins.hashString "md5" config.env.DEVENV_ROOT;
in
{
  packages = [
    pkgs.git
    pkgs.docker
    pkgs.colima
    pkgs.kubectl
    pkgs.k9s
  ];

  languages = {
    opentofu.enable = true;
  };

  processes = {
    kubernetes.exec = "envstart";
  };

  scripts.envclean.exec = "colima delete --profile dev-${colimaProfile} --force; rm -Rf ${config.env.DEVENV_ROOT}/opentofu/*.tfstate";
  scripts.envstop.exec = "colima stop --profile dev-${colimaProfile}";
  scripts.envstart.exec = ''colima start \
    --profile dev-${colimaProfile} \
    --kubernetes \
    --cpu 8 \
    --memory 12 \
    --disk 10 \
    --foreground
  '';
}
