{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [





    # ./hardware/audio.nix
    # ./hardware/bluetooth.nix
    # ./hardware/boot.nix
    # ./hardware/fingerprint.nix
    # ./hardware/networking.nix
    # ./hardware/opengl.nix
    # ./hardware/power.nix
    # ./hardware/qmk.nix
    # ./hardware/video.nix



    # ./services/chrony.nix
    ./services/fonts.nix
    # ./services/gnome-keyring.nix
    # ./services/homebrew.nix
    # ./services/i18n.nix
    # ./services/interception-tools.nix
    # ./services/karabiner.nix
    # ./services/networking.nix
    # ./services/nix-ld.nix
    ./services/nix.nix
    ./services/nixpkgs.nix
    # ./services/oomd.nix
    ./services/shell.nix
    # ./services/sshd.nix
    # ./services/terminfo.nix
    # ./services/time.nix
    # ./services/virtualisation.nix
    # ./services/xserver.nix
  ];
}
