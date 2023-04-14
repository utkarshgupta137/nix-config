{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./features/nix.nix
    ./features/nixpkgs.nix
  ];
}
