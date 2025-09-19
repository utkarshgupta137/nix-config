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
      "alacritty"
      "bluesnooze"
      "cloudflare-warp"
      "db-browser-for-sqlite"
      "firefox"
      "google-drive"
      "iina"
      "itsycal"
      "jupyterlab-app"
      "keyboardcleantool"
      "linear-linear"
      "notion"
      "plex"
      "pocket-casts"
      "postman"
      "qbittorrent"
      "qlstephen"
      "qlvideo"
      "signal"
      "slack"
      "steam"
      "tailscale-app"
      "via"
      "whatsapp"
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
