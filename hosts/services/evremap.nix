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

      remap = [
        {
          input = [ "KEY_LEFTALT" ];
          output = [ "KEY_LEFTMETA" ];
        }
        {
          input = [ "KEY_LEFTMETA" ];
          output = [ "KEY_LEFTALT" ];
        }
      ];

      dual_role = [
        {
          input = "KEY_CAPSLOCK";
          tap = [ "KEY_ESC" ];
          hold = [ "KEY_RIGHTCTRL" ];
        }
        {
          input = "KEY_TAB";
          tap = [ "KEY_TAB" ];
          hold = [ "KEY_RIGHTALT" ];
        }
      ];
    };
  };
}
