{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  services.evremap = {
    enable = true;

    settings = {
      device_name = "ITE Tech. Inc. ITE Device(8258) Keyboard";

      dual_role = [
        {
          input = "KEY_CAPSLOCK";
          tap = [ "KEY_ESC" ];
          hold = [ "KEY_LEFTCTRL" ];
        }
        {
          input = "KEY_TAB";
          tap = [ "KEY_TAB" ];
          hold = [ "KEY_LEFTALT" ];
        }
      ];
    };
  };
}
