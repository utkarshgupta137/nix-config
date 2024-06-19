{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.starship = {
    enable = true;
  };

  xdg.configFile."starship.toml" = {
    source = ../../assets/starship.toml;
  };
}
