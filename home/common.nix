{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [



    # ./features/atuin.nix
    ./features/bat.nix
    ./features/bottom.nix
    ./features/broot.nix
    # ./features/firefox.nix
    ./features/git.nix
    ./features/gitui.nix
    ./features/gpg.nix
    ./features/helix.nix
    ./features/home-manager.nix
    ./features/home.nix
    ./features/htop.nix
    ./features/jq.nix
    ./features/lazygit.nix
    ./features/lsd.nix
    ./features/mcfly.nix
    ./features/navi.nix
    ./features/neovim.nix
    ./features/nix-index.nix
    ./features/nix.nix
    ./features/nixpkgs.nix
    # ./features/nushell.nix
    ./features/ssh.nix
    ./features/starship.nix
    ./features/tealdeer.nix
    ./features/zellij.nix
    ./features/zoxide.nix
    ./features/zsh.nix
  ];
}
