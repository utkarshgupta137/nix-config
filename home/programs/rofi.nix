{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.alacritty}/bin/alacritty";
    # TODO
  };
}
