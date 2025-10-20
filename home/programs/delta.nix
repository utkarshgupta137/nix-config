{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.delta = {
    enable = true;
    options = {
      features = "decorations";
      line-numbers = true;
      navigate = true;

      line-numbers-minus-style = "#ff6161";
      line-numbers-plus-style = "#61ff61";
      # minus-emph-style = syntax "#bd0000";
      # minus-style = syntax "#500000";
      # plus-emph-style = syntax "#007a23";
      # plus-style = syntax "#005217";
    };
  };
}
