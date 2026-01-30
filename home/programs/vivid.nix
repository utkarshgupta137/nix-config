{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.vivid = {
    enable = true;
    activeTheme = "one-dark";
  };
}
