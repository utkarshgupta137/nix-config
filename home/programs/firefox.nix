{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-bin;
  };
}
