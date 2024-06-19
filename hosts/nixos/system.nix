{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  networking.hostName = "utkarsh-nix";

  nixpkgs.hostPlatform = "x86_64-linux";

  security.sudo.extraConfig = ''
    Defaults timestamp_timeout=60
  '';

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
