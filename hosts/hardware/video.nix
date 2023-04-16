{ inputs, outputs, lib, config, pkgs, ... }: {
  hardware.brillo = {
    enable = true;
  };
}
