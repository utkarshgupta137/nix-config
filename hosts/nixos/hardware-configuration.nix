{ inputs, outputs, lib, config, pkgs, ... }: {
  boot = {
    initrd.availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usbhid" "usb_storage" "sd_mod" ];
    kernelModules = [ "kvm-amd" ];
  };

  fileSystems = {
    "/" =
      {
        device = "/dev/disk/by-uuid/76ee1a6f-051a-4ceb-8dec-a51829b1396d";
        fsType = "ext4";
      };

    "/boot/efi" =
      {
        device = "/dev/disk/by-uuid/724E-1159";
        fsType = "vfat";
      };
  };

  hardware = {
    cpu.amd.updateMicrocode = true;
    enableAllFirmware = true;
  };
}
