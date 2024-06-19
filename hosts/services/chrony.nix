{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  services.chrony = {
    enable = true;
  };
}
