{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.obsidian = {
    enable = true;
  };
}
