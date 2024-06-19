{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  xdg.configFile."karabiner" = {
    source = ../../assets/karabiner;
    recursive = true;
  };
}
