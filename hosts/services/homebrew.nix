{ inputs, outputs, lib, config, pkgs, ... }: {
  homebrew = {
    enable = true;

    taps = [
      "filosottile/musl-cross"
    ];

    brews = [
      "showkey"
      "filosottile/musl-cross/musl-cross"
    ];

    casks = [
      "1password"
      "bluesnooze"
      "cloudflare-warp"
      "docker"
      "firefox"
      "google-drive"
      "iina"
      "itsycal"
      "keyboardcleantool"
      "linear-linear"
      "notion"
      "postman"
      "qbittorrent"
      "qlstephen"
      "qlvideo"
      "slack"
      "spotify"
      "steam"
      "via"
      "whatsapp"
    ];

    global.brewfile = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
  };
}
