{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.navi = {
    enable = true;
    enableZshIntegration = true;
  };
}
