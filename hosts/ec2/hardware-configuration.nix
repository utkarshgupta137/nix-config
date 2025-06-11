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
    kernelParams = [
      "ena.lpc_size=32"
      "ena.num_io_queues=1"
      "ena.phc_enable=1"
      "ena.rx_queue_size=16384"
      "isolcpus=16-31"
      "mitigations=off"
    ];
    extraModulePackages = [
      (tls-kernel-module.overrideAttrs (_: {
        patches = [ ../../overlays/tls_so_timestamp.patch ];
      }))
    ];
  };

  services.chrony = {
    extraConfig = "
      refclock PHC /dev/ptp0 poll 0 delay 0.000010 prefer
    ";
  };
}
