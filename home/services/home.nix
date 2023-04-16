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
      pinentry_mac
      sqlite

      rustup
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

      cargo-audit
      # cargo-cranky
      cargo-criterion
      cargo-edit
      # cargo-lambda
      cargo-machete
      cargo-nextest
      cargo-update
    ];

    shellAliases = {
      l = "${pkgs.lsd}/bin/lsd -al";
    };

    sessionPath = [
      "${config.home.sessionVariables.CARGO_HOME}/bin"
    ];

    sessionVariables = {
      CARGO_HOME = "${config.xdg.dataHome}/cargo";
      LESSHISTFILE = "${config.xdg.stateHome}/less/history";
      NPM_CONFIG_CACHE = "${config.xdg.cacheHome}/npm";
      RIPGREP_CONFIG_PATH = "${config.xdg.configHome}/.ripgreprc";
      RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
    };

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "22.11";
  };

  xdg.configFile.".ripgreprc" = {
    source = ../../assets/.ripgreprc;
  };
}
