{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  services.plex = {
    enable = true;
    openFirewall = true;
  };

  fileSystems."/mnt/Downloads" = {
    device = "/home/utkarsh/Downloads";
    fsType = "none";
    options = [
      "bind"
      "rw"
    ];
  };
}
