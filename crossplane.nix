{ pkgs, lib, config, inputs, ... }:
{
  packages = [
    pkgs.crossplane-cli
  ];

  processes = {
    registry.exec = "docker run -p 5000:5000 --name registry registry:2";
  };
}
