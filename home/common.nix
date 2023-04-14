{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./features/git.nix
    ./features/home-manager.nix
    ./features/nixpkgs.nix
  ];
}
