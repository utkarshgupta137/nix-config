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
    initrd.availableKernelModules = [
      "nvme"
      "xhci_pci"
      "thunderbolt"
      "usbhid"
      "usb_storage"
      "sd_mod"
    ];
    kernelModules = [ "kvm-amd" ];
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      efi = {
        canTouchEfiVariables = true;
      };
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/b25be8a2-0f71-4db8-800e-a175528acae0";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/436E-EFBD";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/231ab864-f35a-42c6-92c5-555ee5a7e52d"; }
  ];

  hardware = {
    enableAllFirmware = true;
    cpu.amd.updateMicrocode = true;
  };

  services.fprintd = {
    enable = true;
    tod = {
      enable = true;
      driver = pkgs.libfprint-2-tod1-goodix-550a;
    };
  };
}
