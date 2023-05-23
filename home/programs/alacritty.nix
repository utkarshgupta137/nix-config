{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.alacritty = {
    enable = true;

    settings = {
      window.option_as_alt = lib.mkIf (pkgs.stdenv.isDarwin) "Both";

      scrolling.history = 100000;

      font = {
        normal.family = "SauceCodePro Nerd Font";
        bold.style = "SemiBold";
        italic.style = "Medium Italic";

        size = if (pkgs.stdenv.isDarwin) then 13 else 6;

        builtin_box_drawing = true;
      };

      draw_bold_text_with_bright_colors = true;

      selection.save_to_clipboard = true;

      mouse.hide_when_typing = true;

      key_bindings = [
        { key = "Key1"; mods = "Control"; chars = "\\x1b!"; }
        { key = "Key2"; mods = "Control"; chars = "\\x1b@"; }
        { key = "Key3"; mods = "Control"; chars = "\\x1b#"; }
        { key = "Key4"; mods = "Control"; chars = "\\x1b$"; }
        { key = "Key5"; mods = "Control"; chars = "\\x1b%"; }
        { key = "Key6"; mods = "Control"; chars = "\\x1b^"; }
        { key = "Key7"; mods = "Control"; chars = "\\x1b&"; }
        { key = "Key8"; mods = "Control"; chars = "\\x1b*"; }
        { key = "Key9"; mods = "Control"; chars = "\\x1b("; }
        { key = "Key0"; mods = "Control"; chars = "\\x1b)"; }

        { key = "T"; mods = "Command"; chars = "\\x1bT"; }
        { key = "N"; mods = "Command"; chars = "\\x1bN"; }
        { key = "T"; mods = "Command|Shift"; action = "CreateNewWindow"; }
        { key = "N"; mods = "Command|Shift"; action = "SpawnNewInstance"; }

        # Ref: https://stackoverflow.com/questions/16359878/how-to-map-shift-enter
        { key = "Return"; mods = "Shift"; chars = "\\x1b[13;2u"; }
        { key = "Return"; mods = "Control"; chars = "\\x1b[13;5u"; }
        { key = "Return"; mods = "Control|Shift"; chars = "\\x1b[13;6u"; }
      ] ++ lib.optionals (pkgs.stdenv.isDarwin) [
        { key = "LBracket"; mods = "Command"; chars = "\\x1bj"; }
        { key = "RBracket"; mods = "Command"; chars = "\\x1bk"; }
        { key = "LBracket"; mods = "Command|Shift"; chars = "\\x1bh"; }
        { key = "RBracket"; mods = "Command|Shift"; chars = "\\x1bl"; }

        { key = "Q"; mods = "Command"; action = "None"; }
        { key = "W"; mods = "Command"; action = "None"; }
      ] ++ lib.optionals (pkgs.stdenv.isLinux) [
        { key = "C"; mods = "Command"; action = "Copy"; }
        { key = "V"; mods = "Command"; action = "Paste"; }
      ];
    };
  };
}
