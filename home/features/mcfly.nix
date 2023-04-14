{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.mcfly = {
    enable = true;
    enableZshIntegration = true;
    keyScheme = "vim";
  };
}
