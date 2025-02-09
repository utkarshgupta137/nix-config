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

    # ./services/chrony.nix
    # ./services/evremap.nix
    ./services/fonts.nix
    # ./services/homebrew.nix
    # ./services/i18n.nix
    # ./services/karabiner.nix
    # ./services/networking.nix
    # ./services/nix-ld.nix
    ./services/nix.nix
    ./services/nixpkgs.nix
    # ./services/oomd.nix
    # ./services/pipewire.nix
    # ./services/printing.nix
    ./services/shell.nix
    # ./services/sshd.nix
    # ./services/terminfo.nix
    # ./services/time.nix
    # ./services/xserver.nix
  ];
}
