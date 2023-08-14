{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.htop = {
    enable = true;
    package = pkgs.htop-vim;
    settings = {
      delay = 10;
      fields = with config.lib.htop.fields; [
        PID
        PRIORITY
        NICE
        USER
        M_SIZE
        M_RESIDENT
        M_SHARE
        PERCENT_CPU
        PERCENT_MEM
        TIME
        COMM
      ];
      highlight_base_name = true;
      highlight_changes = true;
      hide_userland_threads = false;
      shadow_distribution_path_prefix = true;
      shadow_other_users = true;
      show_thread_names = true;
      tree_view = true;
      tree_sort_key = config.lib.htop.fields.COMM;
    } // (with config.lib.htop; leftMeters [
      (bar "LeftCPUs")
      (text "Blank")
      (bar "CPU")
      (bar "Memory")
      (bar "Swap")
    ]) // (with config.lib.htop; rightMeters [
      (bar "RightCPUs")
      (text "Blank")
      (text "Tasks")
      (text "LoadAverage")
      (text "Uptime")
    ]);
  };
}
