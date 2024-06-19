{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  systemd.oomd = {
    enableUserSlices = true;
  };
}
