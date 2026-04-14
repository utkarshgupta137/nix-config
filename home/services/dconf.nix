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
  };
}
