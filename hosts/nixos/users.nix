{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  users = {
    defaultUserShell = pkgs.fish;

    users = {
      utkarsh = {
        isNormalUser = true;
        description = "Utkarsh Gupta";
        extraGroups = [
          "audio"
          "docker"
          "input"
          "networkmanager"
          "storage"
          "video"
          "wheel"
        ];
      };
    };
  };
}
