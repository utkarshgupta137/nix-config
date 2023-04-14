{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.lsd = {
    enable = true;
    enableAliases = true;
    settings = {
      sorting = {
        dir-grouping = "first";
      };
    };
  };
}
