{ inputs, outputs, lib, config, pkgs, ... }: {
  users = {
    defaultUserShell = pkgs.fish;

    users = {
      utkarsh = {
        isNormalUser = true;
        description = "Utkarsh Gupta";
        extraGroups = [ "docker" "wheel" ];
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIle2H+nw/MkMbQ8Ykzus/7WaLH5HqC/PGoquo+5QriF"
        ];
      };
    };
  };
}
