{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [





    ./programs/alacritty.nix
    ./programs/atuin.nix
    ./programs/bat.nix
    # ./programs/blueman-applet.nix
    ./programs/bottom.nix
    ./programs/broot.nix
    # ./programs/dunst.nix
    # ./programs/feh.nix
    # ./programs/firefox.nix
    ./programs/gh.nix
    ./programs/gitui.nix
    # ./programs/gnome-keyring.nix
    ./programs/granted.nix
    ./programs/helix.nix
    ./programs/htop.nix
    ./programs/jq.nix
    ./programs/lazygit.nix
    ./programs/lsd.nix
    # ./programs/mcfly.nix
    ./programs/navi.nix
    ./programs/neovim.nix
    # ./programs/network-manager-applet.nix
    # ./programs/picom.nix
    # ./programs/playerctl.nix
    # ./programs/polybar.nix
    ./programs/ripgrep.nix
    # ./programs/rofi.nix
    ./programs/starship.nix
    ./programs/tealdeer.nix
    ./programs/zellij.nix
    ./programs/zoxide.nix

    ./services/git.nix
    ./services/gpg.nix
    ./services/home-manager.nix
    ./services/home.nix
    # ./services/karabiner.nix
    ./services/nix-index.nix
    ./services/nix.nix
    ./services/nixpkgs.nix
    # ./services/screen-locker.nix
    ./services/shell.nix
    ./services/ssh.nix
    # ./services/xsession.nix
  ];
}

