{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.zoxide = {
    enable = true;
  };

  home.sessionVariables._ZO_DATA_DIR = "${config.xdg.stateHome}/zoxide";
}
