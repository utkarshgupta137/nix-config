{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./features/fonts.nix
    ./features/networking.nix
    ./features/nix.nix
    ./features/nixpkgs.nix
    ./features/zsh.nix
  ];
}
