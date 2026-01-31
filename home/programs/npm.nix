{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.npm = {
    enable = true;
    package = null;
    settings = {
      cache = "${config.xdg.cacheHome}/npm";
    };
  };
}
