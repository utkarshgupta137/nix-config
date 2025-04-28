{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  home = {
    enableNixpkgsReleaseCheck = true;

    language.base = "en_IE.UTF-8";

    packages =
      with pkgs;
      [
        awscli2
        cmake
        go-migrate
        grafana-loki
        neovim-remote
        ssm-session-manager-plugin
        zstd

        bandwhich
        bmon
        dprint
        just
        nixfmt-rfc-style
        rm-improved
        sccache
        sd
        tokei
        # toml-merge
        tree-sitter
        vivid
        websocat
        xcp

        rustup
        cargo-audit
        cargo-cranky
        cargo-criterion
        cargo-deny
        cargo-hack
        cargo-machete
        cargo-nextest
        cargo-sweep
        cargo-watch
      ]
      ++ lib.optionals (pkgs.stdenv.isDarwin) [
        pinentry_mac

        cargo-flamegraph
      ]
      ++ lib.optionals (pkgs.stdenv.isLinux) [
        gcc
        gnumake
        patchelf
        unzip
        xclip

        pocket-casts
        qbittorrent
        signal-desktop
        sqlitebrowser
      ];

    preferXdgDirectories = true;

    sessionVariables = {
      AWS_CLI_HISTORY_FILE = "${config.xdg.stateHome}/aws/history";
      AWS_CONFIG_FILE = "${config.xdg.configHome}/aws/config";
      CARGO_HOME = "${config.xdg.dataHome}/cargo";
      CARGO_NET_GIT_FETCH_WITH_CLI = "true";
      DPRINT_CACHE_DIR = "${config.xdg.cacheHome}/dprint";
      GOPATH = "${config.xdg.dataHome}/go";
      GRANTED_ALIAS_CONFIGURED = "true";
      IPYTHONDIR = "${config.xdg.dataHome}/ipython";
      LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib:${pkgs.zlib}/lib";
      LESSHISTFILE = "${config.xdg.stateHome}/less/history";
      MYPY_CACHE_DIR = "${config.xdg.cacheHome}/mypy";
      NPM_CONFIG_CACHE = "${config.xdg.cacheHome}/npm";
      PYTHONPYCACHEPREFIX = "${config.xdg.cacheHome}/python";
      RUFF_CACHE_DIR = "${config.xdg.cacheHome}/ruff";
      RUSTC_WRAPPER = "${pkgs.sccache}/bin/sccache";
      RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
      SCCACHE_DIR = "${config.xdg.cacheHome}/sccache";
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
      jr = "zellij -l rsky attach -c rsky options --no-pane-frames";
      jcf = "zellij -l config attach -c config options --no-pane-frames";
      jfx = "zellij -l tfx attach -c tfx options --no-pane-frames";
      jtf = "zellij -l tf attach -c tf";
    };

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "24.11";
  };
}
