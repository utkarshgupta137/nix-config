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

      set -gx LS_COLORS $(vivid generate one-dark)
    '';
  };
}
