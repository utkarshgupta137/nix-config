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
      "karabiner-elements"
      "keyboardcleantool"
      "obsidian"
      "orion"
      "qlstephen"
    ];

    global.brewfile = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
  };
}
