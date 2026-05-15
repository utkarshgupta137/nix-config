_: {
  programs.starship = {
    enable = true;
    presets = [
      "bracketed-segments"
      "nerd-font-symbols"
    ];
    settings = {
      git_commit = {
        only_detached = false;
        tag_disabled = false;
      };

      git_metrics = {
        disabled = false;
        ignore_submodules = true;
      };

      git_status = {
        ignore_submodules = true;
      };

      memory_usage = {
        disabled = false;
        threshold = 85;
      };

      nix_shell = {
        heuristic = true;
      };

      shlvl = {
        disabled = false;
        threshold = 3;
      };

      status = {
        disabled = false;
        map_symbol = true;
        pipestatus = true;
      };

      sudo = {
        disabled = false;
      };

      time = {
        disabled = false;
        time_format = "%R";
      };
    };
  };
}
