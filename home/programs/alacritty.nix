{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.alacritty = {
    enable = true;

    package = lib.mkIf (pkgs.stdenv.isDarwin) null; # installed via brew

    settings = {
      window.option_as_alt = lib.mkIf (pkgs.stdenv.isDarwin) "Both";

      scrolling.history = 100000;

      font = {
        normal.family = "SauceCodePro Nerd Font Propo";
        bold.style = "SemiBold";
        italic.style = "Medium Italic";

        size = 13;
      };

      colors.draw_bold_text_with_bright_colors = true;

      selection.save_to_clipboard = true;

      mouse.hide_when_typing = if (pkgs.stdenv.isDarwin) then true else false;

      keyboard.bindings = [
        {
          key = "Key1";
          mods = "Control";
          chars = "\\u001B!";
        }
        {
          key = "Key2";
          mods = "Control";
          chars = "\\u001B@";
        }
        {
          key = "Key3";
          mods = "Control";
          chars = "\\u001B#";
        }
        {
          key = "Key4";
          mods = "Control";
          chars = "\\u001B$";
        }
        {
          key = "Key5";
          mods = "Control";
          chars = "\\u001B%";
        }
        {
          key = "Key6";
          mods = "Control";
          chars = "\\u001B^";
        }
        {
          key = "Key7";
          mods = "Control";
          chars = "\\u001B&";
        }
        {
          key = "Key8";
          mods = "Control";
          chars = "\\u001B*";
        }
        {
          key = "Key9";
          mods = "Control";
          chars = "\\u001B(";
        }
        {
          key = "Key0";
          mods = "Control";
          chars = "\\u001B)";
        }

        # Ref: https://stackoverflow.com/questions/16359878/how-to-map-shift-enter
        {
          key = "Return";
          mods = "Shift";
          chars = "\\u001B[13;2u";
        }
        {
          key = "Return";
          mods = "Control";
          chars = "\\u001B[13;5u";
        }
        {
          key = "Return";
          mods = "Control|Shift";
          chars = "\\u001B[13;6u";
        }
      ]
      ++ lib.optionals (pkgs.stdenv.isDarwin) [
        {
          key = "H";
          mods = "Alt|Shift";
          action = "SelectPreviousTab";
        }
        {
          key = "L";
          mods = "Alt|Shift";
          action = "SelectNextTab";
        }

        {
          key = "Q";
          mods = "Command";
          action = "None";
        }
        {
          key = "W";
          mods = "Command";
          action = "None";
        }

        {
          key = "T";
          mods = "Command";
          chars = "\\u001BT";
        }
        {
          key = "N";
          mods = "Command";
          chars = "\\u001BN";
        }
        {
          key = "T";
          mods = "Command|Shift";
          action = "CreateNewTab";
        }
        {
          key = "N";
          mods = "Command|Shift";
          action = "CreateNewWindow";
        }
      ]
      ++ lib.optionals (pkgs.stdenv.isLinux) [
        {
          key = "C";
          mods = "Super";
          action = "Copy";
        }
        {
          key = "V";
          mods = "Super";
          action = "Paste";
        }
        {
          key = "T";
          mods = "Super";
          chars = "\\u001BT";
        }
        {
          key = "N";
          mods = "Super";
          chars = "\\u001BN";
        }
        {
          key = "N";
          mods = "Super|Shift";
          action = "CreateNewWindow";
        }
      ];
    };
  };
}
