{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [
      batman
      batpipe
      prettybat
    ];
  };
}
