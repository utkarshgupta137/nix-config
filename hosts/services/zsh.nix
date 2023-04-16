{ inputs, outputs, lib, config, pkgs, ... }: {
  environment = {
    pathsToLink = [ "/share/zsh" ];
    shells = [ pkgs.zsh ];
    variables.ZDOTDIR = "\$HOME/.config/zsh";
  };

  programs.zsh = {
    enable = true;
    enableSyntaxHighlighting = true;
  };
}
