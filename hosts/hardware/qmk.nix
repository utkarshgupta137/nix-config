{ inputs, outputs, lib, config, pkgs, ... }: {
  hardware.keyboard.qmk = {
    enable = true;
  };
}
