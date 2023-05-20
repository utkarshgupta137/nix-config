{ inputs, outputs, lib, config, pkgs, ... }: {
  home = {
    enableNixpkgsReleaseCheck = true;

    language.base = "en_IE.UTF-8";

    packages = with pkgs; [
      awscli2
      cmake
      grafana-loki
      influxdb2-cli
      localstack
      neovim-remote
      sqlite

      dprint
      fd
      just
      ripgrep
      rm-improved
      sd
      tokei
      # toml-merge
      tree-sitter
      # vector
      vivid
      xcp

      rustup
      cargo-audit
      # cargo-cranky
      cargo-criterion
      cargo-edit
      # cargo-lambda
      cargo-machete
      cargo-nextest
      cargo-update
    ] ++ lib.optionals (pkgs.stdenv.isDarwin) [
      pinentry_mac
    ] ++ lib.optionals (pkgs.stdenv.isLinux) [
      efibootmgr
      gcc
      playerctl
      xclip

      discord
      gnome.gnome-calculator
      gnome.gnome-screenshot
      spotify
    ];

    sessionVariables = {
      CARGO_HOME = "${config.xdg.dataHome}/cargo";
      LESSHISTFILE = "${config.xdg.stateHome}/less/history";
      NPM_CONFIG_CACHE = "${config.xdg.cacheHome}/npm";
      RIPGREP_CONFIG_PATH = "${config.xdg.configHome}/.ripgreprc";
      RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
    };

    shellAliases = {
      l = "lsd -al";
      nixdarwin = "darwin-rebuild --flake ~/utkarsh/nix/config switch";
      nixhome = "home-manager --flake ~/utkarsh/nix/config switch";
      n = "nvim";
      nv = "nvim";
      j = "zellij";
      jcli = "zellij -l cli a -c cli";
      jj = "zellij -l zellij a -c zellij";
      jnx = "zellij -l nix a -c nix";
      jnv = "zellij -l nvim a -c nvim";
      jfx = "zellij -l tfx a -c tfx";
    };

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "22.11";
  };

  home.pointerCursor = lib.mkIf (pkgs.stdenv.isLinux) {
    package = pkgs.apple-cursor;
    name = "macOS-Monterey";

    gtk.enable = true;
    x11.enable = true;
  };

  xdg.configFile.".ripgreprc" = {
    source = ../../assets/.ripgreprc;
  };
}
