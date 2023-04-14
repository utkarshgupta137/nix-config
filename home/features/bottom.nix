{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.bottom = {
    enable = true;
    settings = {
      flags = {
        tree = true;
        show_table_scroll_position = true;
        network_use_bytes = true;
      };
    };
  };
}
