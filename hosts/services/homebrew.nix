{ inputs, outputs, lib, config, pkgs, ... }: {
  homebrew = {
    enable = true;

    taps = [
      "filosottile/musl-cross"
      "vectordotdev/brew"
    ];

    brews = [
      "showkey"
      "filosottile/musl-cross/musl-cross"
      "vectordotdev/brew/vector"
    ];

    caskArgs.require_sha = true;
    casks = [
      "bitwarden"
      "bluesnooze"
      "cloudflare-warp"
      "discord"
      "docker"
      "firefox"
      "google-drive"
      "iina"
      "itsycal"
      "kitty"
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
      "wezterm"
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
