{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  services.dunst = {
    enable = true;
    # TODO
  };
}
