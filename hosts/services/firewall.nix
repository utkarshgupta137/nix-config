{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      8443
    ];
  };
}
