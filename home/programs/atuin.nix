{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.atuin = {
    enable = true;
    daemon.enable = true;
    flags = [ "--disable-up-arrow" ];
    settings = {
      filter_mode = "workspace";
      workspaces = true;
      store_failed = false;
      sync = {
        records = true;
      };
    };
  };
}
