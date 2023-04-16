{ inputs, outputs, lib, config, pkgs, ... }: {
  services.xserver = {
    enable = true;
    enableCtrlAltBackspace = true;

    dpi = 120;

    layout = "us";
    xkbVariant = "";
    autoRepeatDelay = 300;
    autoRepeatInterval = 15;

    libinput = {
      enable = true;
      touchpad = {
        disableWhileTyping = true;
        middleEmulation = false;
        naturalScrolling = true;
      };
    };

    displayManager.gdm = {
      enable = true;
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = [ ];
    };
  };

  environment.variables = {
    MOZ_USE_XINPUT2 = "1";
    XCOMPOSECACHE = "\$HOME/.cache/X11/xcompose";
  };
}
