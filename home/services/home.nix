{
  lib,
  config,
  pkgs,
  ...
}:
{
  home = {
    enableNixpkgsReleaseCheck = true;

    file."Pictures/artemis-eclipse.jpg" = {
      source = builtins.fetchurl {
        name = "artemis-eclipse.jpg";
        url = "https://images-assets.nasa.gov/image/art002e009301/art002e009301~orig.jpg";
        sha256 = "15w63rbg1xb5rsqr2rh81qgx3q8ll71a8nwxbvsfw9ygfk6wnws0";
      };
    };

    language.base = "en_GB.UTF-8";

    packages =
      with pkgs;
      [
        cmake
        git-subrepo
        neovim-remote

        deadnix
        nixfmt
        sccache
        sd
        statix
        tokei
        tree-sitter
        uutils-coreutils-noprefix

        rustup
        cargo-audit
        cargo-deny
        cargo-machete
        cargo-nextest
        cargo-shear
      ]
      ++ lib.optionals pkgs.stdenv.isDarwin [
        docker
        docker-credential-helpers

        cargo-flamegraph
      ]
      ++ lib.optionals pkgs.stdenv.isLinux [
        gcc
        gnumake
        patchelf
        unzip
        xclip

        gnomeExtensions.battery-health-charging
        gnomeExtensions.lockscreen-extension
        lenovo-legion

        qbittorrent
        signal-desktop
      ];

    preferXdgDirectories = true;

    sessionVariables = lib.mkMerge [
      {
        IPYTHONDIR = "${config.xdg.dataHome}/ipython";
        LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
        LESSHISTFILE = "${config.xdg.stateHome}/less/history";
        MYPY_CACHE_DIR = "${config.xdg.cacheHome}/mypy";
        NODE_REPL_HISTORY = "${config.xdg.stateHome}/node/history";
        PYTHONPYCACHEPREFIX = "${config.xdg.cacheHome}/python";
        PYTHON_HISTORY = "${config.xdg.stateHome}/python/history";
        RUFF_CACHE_DIR = "${config.xdg.cacheHome}/ruff";
        RUSTUP_AUTO_INSTALL = "0";
        RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
        SCCACHE_DIR = "${config.xdg.cacheHome}/sccache";
        TIME_STYLE = "long-iso";
        WAKATIME_HOME = "${config.xdg.dataHome}/wakatime";
        _ZO_DATA_DIR = "${config.xdg.stateHome}/zoxide";
      }

      (lib.optionalAttrs pkgs.stdenv.isDarwin {
        XDG_RUNTIME_DIR = "${config.home.homeDirectory}/.local/run";
      })
    ];

    shellAliases = {
      l = "lsd -al";
      n = "nvim";
      nv = "nvim";
      j = "zellij";
      jr = "zellij -l rsky attach -c rsky";
      jc = "zellij -l config attach -c config";
    };

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "26.11";
  };

  xdg = {
    enable = true;
    localBinInPath = true;
    configFile.karabiner = lib.mkIf pkgs.stdenv.isDarwin {
      source = ../../assets/karabiner;
      recursive = true;
    };
  };
}
