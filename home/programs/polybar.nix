{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  xdg.configFile."polybar" = {
    source = ../../assets/polybar;
    recursive = true;
  };
}
