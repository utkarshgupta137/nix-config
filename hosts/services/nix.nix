{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  nix = {
    package = pkgs.nixVersions.latest;

    gc.automatic = true;

    optimise.automatic = true;

    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;

      sandbox = true;

      trusted-substituters = [
        "https://cache.nixos.org"
        "https://hydra.nixos.org"
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "hydra.nixos.org-1:CNHJZBh9K4tP3EKF6FkkgeVYsS3ohTl+oS0Qa8bezVs="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];

      use-xdg-base-directories = true;

      warn-dirty = false;
    };
  };
}
