{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.gpg = {
    enable = true;
    homedir = "${config.xdg.dataHome}/gnupg";
  };

  services.gpg-agent = {
    pinentryFlavor = null;
    extraConfig = ''
      pinentry-program /usr/local/opt/pinentry-touchid/bin/pinentry-touchid
    '';
  };
}
