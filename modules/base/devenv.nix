{ pkgs, lib, config, inputs, ... }:
let
  clusterName = builtins.hashString "md5" config.env.DEVENV_ROOT;
in
{
  dotenv.enable = true;

  scripts.teda.exec = ''
      TEMPFILE=$(mktemp)
      trap 'rm -f "$TEMPFILE"' EXIT

      echo "version: 3" > "$TEMPFILE"
      echo "includes:" >> "$TEMPFILE"
      for var in ''${!TASKFILE_*}; do
        name="''${var#TASKFILE_}"
        echo "  $name: ''${!var}" >> "$TEMPFILE"
      done

      task --taskfile "$TEMPFILE" "$@"
    '';
  #
  packages = [
    pkgs.git
    pkgs.jq
    pkgs.kind
    pkgs.kubectl
    pkgs.k9s
    pkgs.kyverno-chainsaw
    pkgs.mkcert
    pkgs.cilium-cli
    pkgs.go-task
  ];
}
