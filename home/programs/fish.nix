_: {
  programs.fish = {
    enable = true;
    shellAbbrs = {
      "-" = "cd -";
    };
    shellInit = /* fish */ ''
      set -U fish_greeting
    '';
  };
}
