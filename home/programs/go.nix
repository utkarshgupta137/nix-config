{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.go = {
    enable = true;
  };
}
