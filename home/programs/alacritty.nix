{
  lib,
  pkgs,
  ...
}:
{
  programs.alacritty = {
    enable = true;

    package = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin null; # installed via brew

    settings = {
      window = {
        resize_increments = true;
        option_as_alt = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin "Both";
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
          if pkgs.stdenv.hostPlatform.isDarwin then
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

      mouse.hide_when_typing = if pkgs.stdenv.hostPlatform.isDarwin then true else false;

      keyboard.bindings =
        let
          esc = builtins.fromJSON ''"\u001b"''; # ESC (0x1b)

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
            mods = if pkgs.stdenv.hostPlatform.isDarwin then "Command" else "Control";
            chars = "${esc}${n}";
          }) digits;
        in
        digitBindings
        ++ [
          # Ref: https://stackoverflow.com/questions/16359878/how-to-map-shift-enter
          {
            key = "Return";
            mods = "Shift";
            chars = "${esc}[13;2u";
          }
          {
            key = "Return";
            mods = "Control";
            chars = "${esc}[13;5u";
          }
          {
            key = "Return";
            mods = "Control|Shift";
            chars = "${esc}[13;6u";
          }
        ]
        ++ lib.optionals pkgs.stdenv.hostPlatform.isDarwin [
          {
            key = "T";
            mods = "Command";
            chars = "${esc}T";
          }
          {
            key = "N";
            mods = "Command";
            chars = "${esc}N";
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
        ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux [
          {
            key = "T";
            mods = "Super";
            chars = "${esc}T";
          }
          {
            key = "N";
            mods = "Super";
            chars = "${esc}N";
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
