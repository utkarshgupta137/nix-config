{ inputs, outputs, lib, config, pkgs, ... }: {
  nix = {
    package = pkgs.nixUnstable;

    settings = {
      use-xdg-base-directories = true;
      warn-dirty = false;
    };
  };
}
