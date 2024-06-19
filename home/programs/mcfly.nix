{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.mcfly = {
    enable = true;
    keyScheme = "vim";
  };
}
