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
    ./programs/bottom.nix
    ./programs/broot.nix
    ./programs/fd.nix
    ./programs/fzf.nix
    ./programs/gh.nix
    ./programs/gitui.nix
    ./programs/go.nix
    ./programs/granted.nix
    ./programs/helix.nix
    ./programs/htop.nix
    ./programs/jq.nix
    ./programs/lazygit.nix
    ./programs/lsd.nix
    ./programs/navi.nix
    ./programs/neovim.nix
    ./programs/obsidian.nix
    ./programs/ripgrep.nix
    ./programs/starship.nix
    ./programs/tealdeer.nix
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
