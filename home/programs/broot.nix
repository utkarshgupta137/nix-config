{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.broot = {
    enable = true;
    settings.modal = true;
  };
}
