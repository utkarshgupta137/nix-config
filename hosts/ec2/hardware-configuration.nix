{ inputs, outputs, lib, config, pkgs, ... }: {
  boot = {
    kernelParams = [ "nosmt" "isolcpus=0-19" ];
  };

  fileSystems = {
    "/data" = {
      autoFormat = true;
      device = "/dev/disk/by-path/pci-0000:00:1f.0-nvme-1";
      fsType = "xfs";
    };
  };
}
