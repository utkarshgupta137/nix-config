{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [





    ./programs/bat.nix
    ./programs/bottom.nix
    ./programs/broot.nix
    # ./programs/firefox.nix
    ./programs/gitui.nix
    ./programs/helix.nix
    ./programs/htop.nix
    ./programs/jq.nix
    ./programs/lazygit.nix
    ./programs/lsd.nix
    # ./programs/mcfly.nix
    ./programs/navi.nix
    ./programs/neovim.nix
    # ./programs/nushell.nix
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
    ./services/ssh.nix
    ./services/zsh.nix
  ];
}
