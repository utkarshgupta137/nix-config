{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  nix =
    let
      flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in
    lib.mkMerge [
      {
        package = pkgs.nixVersions.latest;

        gc.automatic = true;

        optimise.automatic = true;

        settings = {
          # Enable flakes and new 'nix' command
          experimental-features = "nix-command flakes";
          # Opinionated: disable global registry
          flake-registry = "";
          # Workaround for https://github.com/NixOS/nix/issues/9574
          nix-path = config.nix.nixPath;

          trusted-substituters = [
            "https://cache.nixos.org"
            "https://hydra.nixos.org"
            "https://nix-community.cachix.org"
          ];
          trusted-public-keys = [
            "hydra.nixos.org-1:CNHJZBh9K4tP3EKF6FkkgeVYsS3ohTl+oS0Qa8bezVs="
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          ];

          trusted-users = [
            "root"
            "@wheel"
          ];

          use-xdg-base-directories = true;

          warn-dirty = false;
        };

        # Opinionated: make flake registry and nix path match flake inputs
        registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
        nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
      }

      (lib.optionalAttrs (pkgs.stdenv.isLinux) {
        # Opinionated: disable channels
        channel.enable = false;
      })
    ];
}
