{ inputs, outputs, lib, config, pkgs, ... }: {
  networking.hostName = "utkarsh-dev";

  nixpkgs.hostPlatform = "aarch64-linux";

  security.sudo.extraConfig = ''
    Defaults timestamp_timeout=60
  '';

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
