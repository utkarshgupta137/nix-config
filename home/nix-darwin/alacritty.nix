{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      window.option_as_alt = "Both";

      scrolling.history = 100000;

      font = {
        normal.family = "SauceCodePro Nerd Font";
        bold.style = "SemiBold";
        italic.style = "Medium Italic";

        size = 13;

        builtin_box_drawing = true;
      };

      draw_bold_text_with_bright_colors = true;

      selection.save_to_clipboard = true;

      mouse.hide_when_typing = true;

      key_bindings = [
        { key = "Q"; mods = "Command"; action = "None"; }
        { key = "W"; mods = "Command"; action = "None"; }
        { key = "T"; mods = "Command"; action = "CreateNewWindow"; }
        { key = "N"; mods = "Command"; action = "SpawnNewInstance"; }
      ];
    };
  };
}
