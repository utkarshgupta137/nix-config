{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.zellij = {
    enable = true;
    enableFishIntegration = false;
  };

  # xdg.configFile."zellij" = {
  #   source = ../../assets/zellij;
  #   recursive = true;
  # };
}
