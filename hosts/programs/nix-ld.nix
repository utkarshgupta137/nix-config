{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.nix-ld = {
    enable = true;
  };
}
