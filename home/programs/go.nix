{
  config,
  ...
}:
{
  programs.go = {
    enable = true;
    env = {
      GOCACHE = "${config.xdg.cacheHome}/go";
      GOPATH = "${config.xdg.dataHome}/go";
    };
  };
}
