{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.jq = {
    enable = true;
  };
}
