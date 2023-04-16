{ inputs, outputs, lib, config, pkgs, ... }: {
  fonts = lib.mkMerge [
    {
      fontDir = {
        enable = true;
      };

      fonts = with pkgs; [
        (nerdfonts.override { fonts = [ "SourceCodePro" ]; })
      ] ++ lib.optionals (pkgs.stdenv.isLinux) [
        inputs.apple-fonts.packages.${pkgs.system}.sf-pro
        inputs.apple-fonts.packages.${pkgs.system}.ny
      ];
    }

    (lib.optionalAttrs (pkgs.stdenv.isLinux) {
      fontconfig.defaultFonts = lib.mkIf (pkgs.stdenv.isLinux) {
        emoji = [ "SauceCodePro Nerd Font" ];
        monospace = [ "SauceCodePro Nerd Font" ];
        sansSerif = [ "SF Pro" ];
        serif = [ "New York" ];
      };
    })
  ];
}
