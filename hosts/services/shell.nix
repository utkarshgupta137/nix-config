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
    etc."pythonrc" = {
      source = ../../assets/pythonrc;
    };

    profiles = [ "\$HOME/.local/state/nix/profile" ];

    shells = [ pkgs.fish ];

    variables = {
      HISTFILE = "\$HOME/.local/state/bash/history";
      PYTHONSTARTUP = "/etc/pythonrc";
    };
  };

  programs.fish = {
    enable = true;
    useBabelfish = true;
  };
}
