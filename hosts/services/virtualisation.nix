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
      autoPrune = {
        enable = true;
      };
    };
  };
}
