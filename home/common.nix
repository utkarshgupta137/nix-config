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
    # ./programs/alacritty.nix
    ./programs/atuin.nix
    ./programs/bat.nix
    ./programs/delta.nix
    ./programs/fd.nix
    ./programs/fzf.nix
    ./programs/htop.nix
    ./programs/jq.nix
    ./programs/lazygit.nix
    ./programs/lsd.nix
    ./programs/neovim.nix
    ./programs/ripgrep.nix
    ./programs/starship.nix
    ./programs/uv.nix
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
    ./services/shell.nix
    ./services/ssh.nix
  ];
}
