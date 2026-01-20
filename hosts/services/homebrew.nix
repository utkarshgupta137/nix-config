{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  homebrew = {
    enable = true;

    casks = [
      "1password"
      "alacritty"
      "bluesnooze"
      "firefox"
      "itsycal"
      "keyboardcleantool"
      "obsidian"
      "orion"
      "qlstephen"
      "wireshark-app"
    ];

    global.brewfile = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
  };
}
