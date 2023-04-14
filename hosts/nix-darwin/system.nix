{ inputs, outputs, lib, config, pkgs, ... }: {
  security.pam.enableSudoTouchIdAuth = true;

  services.karabiner-elements.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
