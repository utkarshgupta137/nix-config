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

    taps = [
      "filosottile/musl-cross"
      "vectordotdev/brew"
    ];

    brews = [
      "graphviz"
      "libomp"
      "showkey"
      "filosottile/musl-cross/musl-cross"
      "vectordotdev/brew/vector"
    ];

    casks = [
      "1password"
      "bluesnooze"
      "cloudflare-warp"
      "firefox"
      "google-drive"
      "iina"
      "itsycal"
      "jupyterlab"
      "keyboardcleantool"
      "linear-linear"
      "notion"
      "postman"
      "qbittorrent"
      "qlstephen"
      "qlvideo"
      "signal"
      "slack"
      "steam"
      "via"
      "whatsapp"
      "wireshark"
    ];

    global.brewfile = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
  };
}
