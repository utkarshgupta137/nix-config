{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.zellij = {
    enable = true;
  };

  xdg.configFile."zellij" = {
    source = ../../assets/zellij;
    recursive = true;
  };
}
