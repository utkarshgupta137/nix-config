{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  services.printing = {
    enable = true;
  };
}
