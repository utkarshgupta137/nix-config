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
      "vectordotdev/brew"
    ];

    brews = [
      "graphviz"
      "libomp"
      "showkey"
      "vectordotdev/brew/vector"
    ];

    casks = [
      "1password"
      "bluesnooze"
      "cloudflare-warp"
      "db-browser-for-sqlite"
      "firefox"
      "google-drive"
      "iina"
      "itsycal"
      "jupyterlab"
      "keyboardcleantool"
      "linear-linear"
      "notion"
      "pocket-casts"
      "postman"
      "qbittorrent"
      "qlstephen"
      "qlvideo"
      "signal"
      "slack"
      "steam"
      "tailscale"
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
