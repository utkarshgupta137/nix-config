{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.atuin = {
    enable = true;
    settings = {
      sync_frequency = "1m";
      filter_mode_shell_up_key_binding = "session";
      workspaces = true;
      enter_accept = true;
    };
  };
}
