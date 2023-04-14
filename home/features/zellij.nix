{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.zellij = {
    enable = true;
  };
}
