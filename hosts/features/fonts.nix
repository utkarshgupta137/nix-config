{ inputs, outputs, lib, config, pkgs, ... }: {
  fonts = {
    fontDir.enable = true;

    fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "SourceCodePro" ]; })
    ];
  };
}
