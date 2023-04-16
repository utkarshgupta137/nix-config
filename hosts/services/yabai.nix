{ inputs, outputs, lib, config, pkgs, ... }: {
  services.skhd = {
    enable = true;
  };

  services.spacebar = {
    enable = true;
  };

  services.yabai = {
    enable = true;
    enableScriptingAddition = true;
  };
}
