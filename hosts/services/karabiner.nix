{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  services.karabiner-elements = {
    enable = true;
  };
}
