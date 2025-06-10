{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    # ./programs/_1password-gui.nix
    # ./programs/firefox.nix
    # ./programs/nix-ld.nix
    # ./programs/steam.nix

    # ./services/chrony.nix
    # ./services/evremap.nix
    ./services/fonts.nix
    # ./services/firewall.nix
    # ./services/homebrew.nix
    # ./services/i18n.nix
    # ./services/karabiner.nix
    # ./services/networking.nix
    ./services/nix.nix
    ./services/nixpkgs.nix
    # ./services/oomd.nix
    # ./services/pipewire.nix
    # ./services/plex.nix
    # ./services/printing.nix
    ./services/shell.nix
    # ./services/sshd.nix
    # ./services/tailscale.nix
    # ./services/time.nix
    # ./services/virtualisation.nix
    # ./services/xserver.nix
  ];
}
