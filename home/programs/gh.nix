{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.gh = {
    enable = true;

    settings.git_protocol = "ssh";
  };
}
