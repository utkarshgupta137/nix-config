{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  boot = {
    kernelModules = [ "tls" ];
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [ "nosmt" ];
  };
}
