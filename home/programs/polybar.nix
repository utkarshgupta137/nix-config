{ inputs, outputs, lib, config, pkgs, ... }: {
  services.polybar = {
    enable = true;

    package = pkgs.polybarFull;

    script = "polybar &";

    settings = { };
  };
}
