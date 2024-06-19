{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.ripgrep = {
    enable = true;
    arguments = [
      "--follow"
      "--glob=!**/.git/"
      "--hidden"
      "--max-columns=250"
      "--max-columns-preview"
      "--smart-case"
    ];
  };
}
