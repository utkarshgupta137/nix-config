{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs._1password-gui = {
    enable = true;
  };
}
