{
  lib,
  pkgs,
  ...
}:
{
  programs.alacritty = {
    enable = true;

    package = lib.mkIf pkgs.stdenv.isDarwin null; # installed via brew

    settings = {
      window = {
        resize_increments = true;
        option_as_alt = lib.mkIf pkgs.stdenv.isDarwin "Both";
      };

      scrolling.history = 100000;

      font = {
        normal.family = "SauceCodePro Nerd Font Propo";
        bold.style = "SemiBold";
        italic.style = "Medium Italic";

        size = 13;
      };

      colors.draw_bold_text_with_bright_colors = true;

      bell = {
        command =
          if pkgs.stdenv.isDarwin then
            {
              program = "osascript";
              args = [
                "-e"
                "beep"
              ];
            }
          else
            {
              program = "pw-play";
              args = [ "${pkgs.sound-theme-freedesktop}/share/sounds/freedesktop/stereo/bell.oga" ];
            };
      };

      selection.save_to_clipboard = true;

      mouse.hide_when_typing = if pkgs.stdenv.isDarwin then true else false;

      keyboard.bindings =
        let
          digits = [
            "1"
            "2"
            "3"
            "4"
            "5"
            "6"
            "7"
            "8"
            "9"
          ];
          # Remap <mod>+<digit> -> Alt+<digit>
          digitBindings = map (n: {
            key = "Key${n}";
            mods = if pkgs.stdenv.isDarwin then "Command" else "Control";
            chars = "\\u001B${n}";
          }) digits;
        in
        digitBindings
        ++ [
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
        ++ lib.optionals pkgs.stdenv.isDarwin [
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
            key = "W";
            mods = "Command";
            action = "None";
          }
          {
            key = "Q";
            mods = "Command";
            action = "None";
          }
        ]
        ++ lib.optionals pkgs.stdenv.isLinux [
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
        ];
    };
  };
}
