{ inputs, outputs, lib, config, pkgs, ... }: {
  services.gnome-keyring = {
    enable = true;
  };
}
