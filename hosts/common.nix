{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [






    ./services/fonts.nix
    # ./services/homebrew.nix
    # ./services/karabiner.nix
    ./services/networking.nix
    ./services/nix.nix
    ./services/nixpkgs.nix
    # ./services/yabai.nix
    ./services/zsh.nix
  ];
}
