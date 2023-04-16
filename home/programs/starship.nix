{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
  };

  xdg.configFile."starship.toml" = {
    source = ../../assets/starship.toml;
  };
}
