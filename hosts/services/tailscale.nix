{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  services.tailscale = {
    enable = true;
  };
}
