_: {
  services = {
    displayManager.gdm = {
      enable = true;
    };

    desktopManager.gnome = {
      enable = true;
    };
  };

  services.xserver = {
    enable = true;

    autoRepeatDelay = 300;
    autoRepeatInterval = 15;

    xkb = {
      layout = "us";
      variant = "";
    };
  };

  services.logind.settings.Login.HandleLidSwitchExternalPower = "ignore";
}
