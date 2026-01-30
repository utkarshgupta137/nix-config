{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  services.colima = {
    enable = true;
    limaHomeDir = "${config.xdg.dataHome}/lima";
  };
}
