{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.go = {
    enable = true;
    env = {
      GOPATH = "${config.xdg.dataHome}/go";
    };
  };
}
