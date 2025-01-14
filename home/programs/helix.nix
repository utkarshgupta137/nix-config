{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.helix = {
    enable = true;

    languages = {
      language-server.rust-analyzer = {
        command = "rustup";
        args = [
          "run"
          "stable"
          "rust-analyzer"
        ];
      };
    };

    settings = {
      theme = "github_dark_dimmed";

      editor = {
        scrolloff = 8;
        line-number = "relative";
        cursorline = true;
        completion-replace = true;
        rulers = [ 100 ];
        bufferline = "always";
        color-modes = true;
        text-width = 100;

        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };

        cursor-shape.insert = "bar";

        file-picker = {
          hidden = false;
          parents = false;
          ignore = false;
          # git-ignore = false;
          git-global = false;
          git-exclude = false;
        };

        whitespace.render.tab = "all";

        indent-guides = {
          render = true;
          character = "▏";
        };

        inline-diagnostics = {
          cursor-line = "warning";
        };
      };
    };
  };
}
