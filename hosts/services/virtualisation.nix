{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = true;
      autoPrune.enable = true;
    };
  };
}
