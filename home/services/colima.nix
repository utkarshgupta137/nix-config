{
  config,
  ...
}:
{
  services.colima = {
    enable = true;
    limaHomeDir = "${config.xdg.dataHome}/lima";
    profiles = {
      default = {
        isActive = true;
        setDockerHost = true;
      };
    };
  };
}
