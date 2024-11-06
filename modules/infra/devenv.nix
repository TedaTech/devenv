{ pkgs, config, ... }:
{
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
