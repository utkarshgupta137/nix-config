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
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };

      grub = {
        enable = true;
        configurationLimit = 3;
        default = "saved";
        device = "nodev";
        efiSupport = true;
        fsIdentifier = "label";
        useOSProber = true;

        extraEntries = ''
          menuentry "System shutdown" {
            echo "System shutting down..."
            halt
          }
          menuentry "System restart" {
            echo "System rebooting..."
            reboot
          }
          menuentry 'UEFI Firmware Settings' --id 'uefi-firmware' {
            fwsetup
          }
        '';
      };
    };
  };
}
