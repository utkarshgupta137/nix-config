{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  services.fprintd = {
    enable = true;
    tod = {
      enable = true;
      driver = pkgs.libfprint-2-tod1-goodix-550a;
    };
  };
}
