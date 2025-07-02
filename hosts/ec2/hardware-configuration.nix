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
    kernelParams = [
      "ena.lpc_size=32"
      "ena.num_io_queues=1"
      "ena.phc_enable=1"
      "ena.rx_queue_size=16384"
      "isolcpus=16-31"
      "mitigations=off"
    ];
  };

  services.chrony = {
    extraConfig = "
      refclock PHC /dev/ptp0 poll 0 delay 0.000010 prefer
    ";
  };
}
