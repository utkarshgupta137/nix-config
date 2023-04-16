{ inputs, outputs, lib, config, pkgs, ... }: {
  networking = {
    hostName = "utkarsh-mbp";
    localHostName = "utkarsh-mbp";
    computerName = "utkarsh-mbp";
  };

  security.pam.enableSudoTouchIdAuth = true;

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon = {
    enable = true;
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
