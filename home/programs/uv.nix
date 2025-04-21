{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.uv = {
    enable = true;
  };
}
