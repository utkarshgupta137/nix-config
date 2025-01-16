{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.fzf = {
    enable = true;
  };
}
