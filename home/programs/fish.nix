{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      "-" = "cd -";
    };
    shellInit = /* fish */ ''
      set -U fish_greeting
    '';
  };
}
