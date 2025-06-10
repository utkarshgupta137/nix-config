# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    ../common.nix
    ../programs/_1password-gui.nix
    ../programs/firefox.nix
    ../programs/nix-ld.nix
    ../programs/steam.nix
    ../services/chrony.nix
    ../services/evremap.nix
    ../services/firewall.nix
    ../services/i18n.nix
    ../services/oomd.nix
    ../services/pipewire.nix
    ../services/plex.nix
    ../services/printing.nix
    ../services/tailscale.nix
    ../services/time.nix
    ../services/virtualisation.nix
    ../services/xserver.nix
    ./system.nix
    ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
  ];
}
