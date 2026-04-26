_: {
  programs.ripgrep = {
    enable = true;
    arguments = [
      "--follow"
      "--glob=!**/.git/"
      "--hidden"
      "--max-columns=250"
      "--max-columns-preview"
      "--smart-case"
      "--sort=path"
    ];
  };
}
