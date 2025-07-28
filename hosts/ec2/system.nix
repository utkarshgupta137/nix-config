{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  networking.hostName = "utkarsh-dev";

  nixpkgs.hostPlatform = "aarch64-linux";

  security = {
    pam.loginLimits = [
      {
        domain = "*";
        item = "nofile";
        type = "-";
        value = "65536";
      }
    ];
    sudo.extraConfig = ''
      Defaults timestamp_timeout=60
    '';
  };

  services.amazon-ssm-agent.enable = lib.mkForce false;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "25.05";
}
