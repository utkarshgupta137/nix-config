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

    settings = {
      KbdInteractiveAuthentication = false;
      # Opinionated: use keys only.
      # Remove if you want to SSH using passwords
      PasswordAuthentication = false;
      # Opinionated: forbid root login through SSH.
      PermitRootLogin = lib.mkForce "no";
    };
  };
}
