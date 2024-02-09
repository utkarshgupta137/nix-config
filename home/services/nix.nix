{ inputs, outputs, lib, config, pkgs, ... }: {
  nix = {
    package = pkgs.nixUnstable;

    gc.automatic = true;

    settings = {
      use-xdg-base-directories = true;

      warn-dirty = false;
    };
  };
}
