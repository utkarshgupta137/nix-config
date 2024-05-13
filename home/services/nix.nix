{ inputs, outputs, lib, config, pkgs, ... }: {
  nix = {
    package = pkgs.nixVersions.latest;

    gc.automatic = true;

    settings = {
      use-xdg-base-directories = true;

      warn-dirty = false;
    };
  };
}
