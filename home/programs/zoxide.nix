{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
  };

  home.sessionVariables._ZO_DATA_DIR = "${config.xdg.stateHome}/zoxide";
}
