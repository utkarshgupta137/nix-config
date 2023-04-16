{ inputs, outputs, lib, config, pkgs, ... }: {
  users = {
    defaultUserShell = pkgs.zsh;

    users = {
      utkarsh = {
        isNormalUser = true;
        description = "Utkarsh Gupta";
        extraGroups = [ "audio" "input" "networkmanager" "storage" "video" "wheel" ];
      };
    };
  };
}
