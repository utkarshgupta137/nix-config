{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;
  };

  home.file.".dprint.json" = {
    source = ../../assets/dprint.json;
  };
}
