{
  lib,
  pkgs,
  ...
}:
{
  nix = lib.mkMerge [
    {
      package = pkgs.nixVersions.latest;

      gc.automatic = true;

      optimise.automatic = true;

      settings = {
        # Enable flakes and new 'nix' command
        experimental-features = "nix-command flakes";
        # Opinionated: disable global registry
        flake-registry = "";

        extra-substituters = [
          "https://nix-community.cachix.org"
        ];
        extra-trusted-public-keys = [
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        ];

        use-xdg-base-directories = true;

        warn-dirty = false;
      };
    }

    (lib.optionalAttrs pkgs.stdenv.hostPlatform.isLinux {
      # Opinionated: disable channels
      channel.enable = false;
    })
  ];
}
