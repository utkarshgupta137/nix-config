{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.atuin = {
    enable = true;
    flags = [ "--disable-up-arrow" ];
    settings = {
      sync_frequency = "1m";
      workspaces = true;
    };
  };
}
