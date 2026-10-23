_: {
  programs.fd = {
    enable = true;
    extraOptions = [
      "--follow"
      "--exclude=.git/"
      "--hidden"
    ];
  };
}
