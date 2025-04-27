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

  services.timesyncd.enable = false;
}
