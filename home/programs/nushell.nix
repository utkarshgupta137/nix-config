{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.nushell = {
    enable = true;
  };
}
