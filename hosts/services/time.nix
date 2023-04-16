{ inputs, outputs, lib, config, pkgs, ... }: {
  time.hardwareClockInLocalTime = true;

  time.timeZone = "Asia/Kolkata";
}
