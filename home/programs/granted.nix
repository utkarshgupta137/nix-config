{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.granted = {
    enable = true;
  };
}
