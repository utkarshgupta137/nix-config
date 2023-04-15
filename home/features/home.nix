{ inputs, outputs, lib, config, pkgs, ... }: {
  home = {
    enableNixpkgsReleaseCheck = true;

    language.base = "en_IE.UTF-8";

    # cargo-cranky
    # toml-merge

    packages = with pkgs; [
      pinentry_mac

      awscli2
      cmake
      grafana-loki
      influxdb2-cli
      localstack
      neovim-remote
      # vector

      rustup
      dprint
      fd
      just
      ripgrep
      rm-improved
      sd
      tokei
      tree-sitter
      vivid
      xcp

      cargo-audit
      cargo-criterion
      cargo-edit
      # cargo-lambda
      cargo-machete
      cargo-nextest
      cargo-update
    ];

    sessionVariables = {
      RIPGREP_CONFIG_PATH = "${config.xdg.configHome}/.ripgreprc";
    };

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "22.11";
  };

  xdg.configFile.".ripgreprc" = {
    source = ../../assets/.ripgreprc;
  };
}
