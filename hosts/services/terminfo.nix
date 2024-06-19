{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  environment = {
    etc = {
      terminfo = {
        source = "${pkgs.ncurses}/share/terminfo";
      };
    };

    systemPackages = [ pkgs.ncurses ];
  };
}
