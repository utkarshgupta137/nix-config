_: {
  programs.docker-cli = {
    enable = true;
    settings = {
      credsStore = "osxkeychain";
    };
  };
}
