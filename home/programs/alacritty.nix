{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.alacritty = {
    enable = true;

    package = lib.mkIf (pkgs.stdenv.isDarwin) pkgs.alacritty-vivid;

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
        { key = "T"; mods = "Command"; action = "CreateNewWindow"; }
      ] ++ lib.optionals (pkgs.stdenv.isDarwin) [
        { key = "Q"; mods = "Command"; action = "None"; }
        { key = "W"; mods = "Command"; action = "None"; }
        { key = "N"; mods = "Command"; action = "SpawnNewInstance"; }
      ] ++ lib.optionals (pkgs.stdenv.isLinux) [
        { key = "C"; mods = "Command"; action = "Copy"; }
        { key = "V"; mods = "Command"; action = "Paste"; }
      ];
    };
  };
}
