{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  environment = {
    profiles = [ "\$HOME/.local/state/nix/profile" ];

    shells = [ pkgs.fish ];

    variables = {
      HISTFILE = "\$HOME/.local/state/bash/history";
    };
  };

  programs.fish = {
    enable = true;
    useBabelfish = true;
  };
}
