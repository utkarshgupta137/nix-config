{ inputs, outputs, lib, config, pkgs, ... }: {
  environment = {
    pathsToLink = [ "/libexec" "/share/zsh" ];

    profiles = [
      "\$HOME/.local/state/nix/profile"
    ];

    shells = [ pkgs.zsh ];

    variables = {
      HISTFILE = "\$HOME/.local/state/bash/history";
      ZDOTDIR = "\$HOME/.config/zsh";
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = false;
    enableBashCompletion = false;
    promptInit = "";
  };
}
