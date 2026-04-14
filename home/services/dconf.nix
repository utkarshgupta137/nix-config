{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = "file://${config.home.homeDirectory}/Pictures/artemis-eclipse.jpg";
      picture-uri-dark = "file://${config.home.homeDirectory}/Pictures/artemis-eclipse.jpg";
      picture-options = "zoom";
    };
    "org/gnome/shell" = {
      enabled-extensions = [
        "Battery-Health-Charging@maniacx.github.com"
        "lockscreen-extension@pratap.fastmail.fm"
      ];
    };
    "org/gnome/shell/extensions/Battery-Health-Charging" = {
      charging-mode = "max";
      show-system-indicator = false;
    };
    "org/gnome/shell/extensions/lockscreen-extension" = {
      hide-lockscreen-extension-button = true;
    };
  };
}
