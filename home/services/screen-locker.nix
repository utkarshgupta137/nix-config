{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [ i3lock-fancy-rapid ];

  services.screen-locker = {
    enable = true;
    lockCmd = "${pkgs.i3lock-fancy-rapid}/bin/i3lock 1 3 -n";
  };
}
