{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.lazydocker = {
    enable = true;
  };
}
