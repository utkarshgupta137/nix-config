{ inputs, outputs, lib, config, pkgs, ... }: {
  services.network-manager-applet = {
    enable = true;
  };
}
