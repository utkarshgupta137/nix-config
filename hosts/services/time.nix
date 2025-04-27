{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  time.hardwareClockInLocalTime = false;

  time.timeZone = "Europe/Dublin";
}
