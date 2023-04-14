{ inputs, outputs, lib, config, pkgs, ... }: {
  # environment.pathsToLink = [ "/share/zsh" ];

  home = {
    sessionPath = [
      "${config.home.sessionVariables.CARGO_HOME}/bin"
    ];

    sessionVariables = {
      XDG_BIN_HOME = "${config.home.homeDirectory}/.local/bin";
      XDG_RUNTIME_DIR = "${config.home.homeDirectory}/.local/run";

      CARGO_HOME = "${config.xdg.dataHome}/cargo";
      LESSHISTFILE = "${config.xdg.stateHome}/less/history";
      NPM_CONFIG_CACHE = "${config.xdg.cacheHome}/npm";
      RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
      TERMINFO = "${config.xdg.dataHome}/terminfo";
      TERMINFO_DIRS = "${config.xdg.dataHome}/terminfo:/usr/share/terminfo";

      TIME_STYLE = "long-iso";
    };

    shellAliases = {
      l = "${pkgs.lsd}/bin/lsd -al";
    };
  };

  programs.zsh = {
    enable = true;

    envExtra = ''
      source "$HOME/tensorfox/.zshenv"
    '';

    profileExtra = ''
      export VISUAL=$EDITOR
    '';

    initExtra = ''
      setopt AUTO_MENU
      setopt HIST_IGNORE_ALL_DUPS

      copy() {
        rm -rf /tmp/copy;
        mkdir -p /tmp/copy;
        cp -rp "$@" /tmp/copy;
        BASE=$(cd /tmp/copy && tar -cz * | base64);
        echo "echo '$BASE' | base64 -d | tar -xz; history -d \$(history 1)";
      }

      export LS_COLORS="$(vivid generate one-dark)"

      # eval "$(github-copilot-cli alias -- "$0")"
    '';

    dotDir = ".config/zsh";

    history = {
      expireDuplicatesFirst = true;
      extended = true;
      ignoreDups = true;
      ignoreSpace = true;
      path = "${config.xdg.stateHome}/zsh/history";
      save = 100000;
      share = true;
      size = 100000;
    };

    prezto = {
      enable = true;

      extraConfig = ''
        zstyle ':prezto:module:autosuggestions' color 'yes'
        zstyle ':prezto:module:syntax-highlighting' color 'yes'
      '';

      editor = {
        dotExpansion = true;
        # keymap = "vi";
      };

      pmodules = [
        "environment"
        "terminal"
        "editor"
        "history"
        "directory"
        "spectrum"
        "utility"
        "osx"
        "homebrew"
        "git"
        # "python"
        "completion"
        "syntax-highlighting"
        "history-substring-search"
        "autosuggestions"
        # "prompt"
      ];

      syntaxHighlighting = {
        highlighters = [
          "main"
          "brackets"
          "pattern"
          "line"
          # "cursor"
          "root"
        ];
      };

      terminal = {
        autoTitle = true;
        tabTitleFormat = "%n: %~";
        windowTitleFormat = "%n: %~";
        multiplexerTitleFormat = "%~";
      };
    };
  };

  xdg.enable = true;
}
