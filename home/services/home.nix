{ inputs, outputs, lib, config, pkgs, ... }: {
  home = {
    enableNixpkgsReleaseCheck = true;

    language.base = "en_IE.UTF-8";

    packages = with pkgs; [
      awscli2
      cmake
      go-migrate
      grafana-loki
      localstack
      neovim-remote
      sqlite
      ssm-session-manager-plugin
      zstd

      bandwhich
      dprint
      fd
      just
      nixpkgs-fmt
      rm-improved
      rye
      sd
      tokei
      # toml-merge
      tree-sitter
      vivid
      xcp

      rustup
      cargo-audit
      cargo-cranky
      cargo-criterion
      cargo-deny
      cargo-expand
      cargo-flamegraph
      cargo-hack
      cargo-lambda
      cargo-machete
      cargo-nextest
      cargo-sweep
      cargo-watch
    ] ++ lib.optionals (pkgs.stdenv.isDarwin) [
      pinentry_mac
    ] ++ lib.optionals (pkgs.stdenv.isLinux) [
      # efibootmgr
      gcc
      gnumake
      patchelf
      # playerctl
      unzip
      # xclip

      vector

      # discord
      # gnome.gnome-calculator
      # gnome.gnome-screenshot
      # spotify
    ];

    sessionVariables = {
      AWS_CLI_HISTORY_FILE = "${config.xdg.stateHome}/aws/history";
      AWS_CONFIG_FILE = "${config.xdg.configHome}/aws/config";
      CARGO_HOME = "${config.xdg.dataHome}/cargo";
      CARGO_NET_GIT_FETCH_WITH_CLI = "true";
      DPRINT_CACHE_DIR = "${config.xdg.cacheHome}/dprint";
      GRANTED_ALIAS_CONFIGURED = "true";
      LESSHISTFILE = "${config.xdg.stateHome}/less/history";
      NPM_CONFIG_CACHE = "${config.xdg.cacheHome}/npm";
      RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
      RYE_HOME = "${config.xdg.dataHome}/rye";
      WAKATIME_HOME = "${config.xdg.dataHome}/wakatime";
    };

    shellAliases = {
      l = "lsd -al";
      nixdarwin = "darwin-rebuild --flake ~/utkarsh/nix/config switch";
      nixlinux = "sudo nixos-rebuild --flake ~/utkarsh/nix/config switch";
      nixhome = "home-manager --flake ~/utkarsh/nix/config switch";
      n = "nvim";
      nv = "nvim";
      j = "zellij";
      ja = "zellij -l alacritty a -c alacritty";
      jcli = "zellij -l cli a -c cli";
      jj = "zellij -l zellij a -c zellij";
      jnx = "zellij -l nix a -c nix";
      jnv = "zellij -l nvim a -c nvim";
      jfx = "zellij -l tfx a -c tfx";
      jtf = "zellij -l tf a -c tf options --pane-frames=true";
    };

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.11";
  };

  home.pointerCursor = lib.mkIf (pkgs.stdenv.isLinux) {
    package = pkgs.apple-cursor;
    name = "macOS-Monterey";

    gtk.enable = true;
    x11.enable = true;
  };
}
