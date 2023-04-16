{ inputs, outputs, lib, config, pkgs, ... }: {
  networking.networkmanager = {
    enable = true;
  };
}
