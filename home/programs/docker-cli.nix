{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.docker-cli = {
    enable = true;
    settings = {
      credsStore = "osxkeychain";
    };
  };
}
