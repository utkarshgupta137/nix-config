{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  hardware.pulseaudio = {
    enable = true;

    package = pkgs.pulseaudioFull;

    extraConfig = "
      load-module module-switch-on-connect
    ";
  };

  security.rtkit = {
    enable = true;
  };

  sound = {
    enable = true;
  };

  nixpkgs.config.pulseaudio = true;
}
