{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.gpg = {
    enable = true;
    homedir = "${config.xdg.dataHome}/gnupg";
  };

  services.gpg-agent = lib.mkIf (pkgs.stdenv.isLinux) {
    enable = true;

    defaultCacheTtl = 3600 * 24 * 365;
    maxCacheTtl = 3600 * 24 * 365;

    pinentryFlavor = "gnome3";
  }
  ;
}
