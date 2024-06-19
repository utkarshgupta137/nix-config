{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  services.openssh = {
    enable = true;

    allowSFTP = false;

    settings = {
      KbdInteractiveAuthentication = false;
      PasswordAuthentication = false;
      PermitRootLogin = lib.mkForce "no";
    };

    extraConfig = ''
      usePAM no
    '';
  };
}
