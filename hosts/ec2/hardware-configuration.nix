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

  fileSystems = {
    "/data" = {
      autoFormat = true;
      device = "/dev/disk/by-path/pci-0000:00:1f.0-nvme-1";
      fsType = "xfs";
    };
  };
}
