{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  hardware.opengl = {
    enable = true;
  };
}
