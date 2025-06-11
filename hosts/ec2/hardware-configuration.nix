{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:

let
  tls-kernel-module = pkgs.callPackage ../../overlays/tls_so_timestamp.nix {
    # Make sure the module targets the same kernel as your system is using.
    kernel = config.boot.kernelPackages.kernel;
  };
in
{
  boot = {
    kernelModules = [ "tls" ];
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [ "nosmt" ];
    extraModulePackages = [
      (tls-kernel-module.overrideAttrs (_: {
        patches = [ ../../overlays/tls_so_timestamp.patch ];
      }))
    ];
  };
}
