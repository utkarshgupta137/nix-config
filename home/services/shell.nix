{ inputs, outputs, lib, config, pkgs, ... }: {
  home = {
    sessionVariables = lib.mkMerge [
      {
        XDG_BIN_HOME = "${config.home.homeDirectory}/.local/bin";

        TIME_STYLE = "long-iso";
      }

      (lib.optionalAttrs (pkgs.stdenv.isDarwin) {
        XDG_RUNTIME_DIR = "${config.home.homeDirectory}/.local/run";
      })
    ];
  };

  programs.fish = {
    enable = true;

    shellInit = ''
      source ~/tensorfox/env.fish

      fish_add_path $CARGO_HOME/bin

      set -U fish_greeting

      set -gx VISUAL $EDITOR
      set -gx LS_COLORS $(vivid generate one-dark)
    '';

    shellAbbrs = {
      "-" = "cd -";
    };
  };

  xdg = {
    enable = true;
  };
}
