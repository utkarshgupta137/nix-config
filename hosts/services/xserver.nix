{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  services.xserver = {
    enable = true;

    autoRepeatDelay = 300;
    autoRepeatInterval = 15;

    displayManager.gdm = {
      enable = true;
    };

    desktopManager.gnome = {
      enable = true;
    };

    videoDrivers = [ "amdgpu" ];

    xkb = {
      layout = "us";
      variant = "";
    };
  };

  services.logind.lidSwitchExternalPower = "ignore";
}
