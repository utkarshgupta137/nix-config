{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.cargo = {
    enable = true;
    package = null;
    cargoHome = "${config.xdg.dataHome}/cargo";
    settings = {
      build = {
        build-dir = "${config.xdg.cacheHome}/cargo";
        incremental = false;
        rustc-wrapper = "${pkgs.sccache}/bin/sccache";
      };
      net = {
        git-fetch-with-cli = true;
      };
    };
  };
}
