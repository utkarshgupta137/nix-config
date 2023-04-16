{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.broot = {
    enable = true;
    enableZshIntegration = true;
    settings.modal = true;
  };
}
