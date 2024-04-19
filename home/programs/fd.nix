{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.fd = {
    enable = true;
    hidden = true;
  };
}
