# This is your system's configuration file.
# Use this to configure your system environment (it replaces $HOME/.nixpkgs/darwin-configuration.nix).

{ inputs, outputs, lib, config, pkgs, ... }: {
  # You can import other nix-darwin modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nix-darwin):
    # outputs.nixDarwinModules.example

    # You can also split up your configuration and import pieces of it here:
    ../common.nix
    ../services/homebrew.nix
    ../services/karabiner.nix
    ../services/networking.nix
    # ../services/yabai.nix
    ./system.nix
  ];
}
