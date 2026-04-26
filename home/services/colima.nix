{
  config,
  ...
}:
{
  services.colima = {
    enable = true;
    limaHomeDir = "${config.xdg.dataHome}/lima";
  };
}
