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

    language.base = "en_GB.UTF-8";

    packages =
      with pkgs;
      [
        cmake
        neovim-remote

        nixfmt
        sccache
        sd
        tokei
        tree-sitter
        uutils-coreutils-noprefix
        vivid

        rustup
        cargo-audit
        cargo-deny
        cargo-machete
        cargo-nextest
        cargo-shear
      ]
      ++ lib.optionals pkgs.stdenv.isDarwin [
        cargo-flamegraph
      ]
      ++ lib.optionals pkgs.stdenv.isLinux [
        gcc
        gnumake
        patchelf
        unzip
        xclip

        qbittorrent
        signal-desktop
      ];

    preferXdgDirectories = true;

    sessionVariables = lib.mkMerge [
      {
        CARGO_BUILD_BUILD_DIR = "${config.xdg.cacheHome}/cargo";
        CARGO_HOME = "${config.xdg.dataHome}/cargo";
        CARGO_NET_GIT_FETCH_WITH_CLI = "true";
        IPYTHONDIR = "${config.xdg.dataHome}/ipython";
        LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
        LESSHISTFILE = "${config.xdg.stateHome}/less/history";
        MYPY_CACHE_DIR = "${config.xdg.cacheHome}/mypy";
        NPM_CONFIG_CACHE = "${config.xdg.cacheHome}/npm";
        PYTHONPYCACHEPREFIX = "${config.xdg.cacheHome}/python";
        RUFF_CACHE_DIR = "${config.xdg.cacheHome}/ruff";
        RUSTC_WRAPPER = "${pkgs.sccache}/bin/sccache";
        RUSTUP_AUTO_INSTALL = "0";
        RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
        SCCACHE_DIR = "${config.xdg.cacheHome}/sccache";
        TIME_STYLE = "long-iso";
        WAKATIME_HOME = "${config.xdg.dataHome}/wakatime";
        XDG_BIN_HOME = "${config.home.homeDirectory}/.local/bin";
        _ZO_DATA_DIR = "${config.xdg.stateHome}/zoxide";
      }

      (lib.optionalAttrs pkgs.stdenv.isDarwin {
        XDG_RUNTIME_DIR = "${config.home.homeDirectory}/.local/run";
      })
    ];

    shellAliases = {
      l = "lsd -al";
      nixdarwin = "sudo darwin-rebuild --flake ~/utkarsh/nix/config switch";
      nixlinux = "sudo nixos-rebuild --flake ~/utkarsh/nix/config switch";
      nixhome = "home-manager --flake ~/utkarsh/nix/config switch";
      n = "nvim";
      nv = "nvim";
      j = "zellij";
      jr = "zellij -l rsky attach -c rsky options --no-pane-frames";
      jc = "zellij -l config attach -c config options --no-pane-frames";
    };

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "26.05";
  };

  xdg = {
    enable = true;
    configFile.karabiner = lib.mkIf pkgs.stdenv.isDarwin {
      source = ../../assets/karabiner;
      recursive = true;
    };
  };
}
