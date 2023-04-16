# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'

{ pkgs ? (import ../nixpkgs.nix) { } }: {
  libfprint-2-tod1-goodix-550a = pkgs.callPackage ./libfprint-2-tod1-goodix-550a.nix { };
}
