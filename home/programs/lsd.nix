{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.lsd = {
    enable = true;
    settings = {
      sorting = {
        dir-grouping = "first";
      };
    };
  };
}
