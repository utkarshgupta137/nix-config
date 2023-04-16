{ inputs, outputs, lib, config, pkgs, ... }: {
  services.dbus.packages = [ pkgs.gcr ];

  services.gnome.gnome-keyring = {
    enable = true;
  };
}
