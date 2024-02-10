{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;
  };

  programs.go.enable = true;

  home.file.".dprint.json" = {
    source = ../../assets/dprint.json;
  };

  xdg.configFile."nvim/lua/plugins/sqlite.lua".text =
    if (pkgs.stdenv.isDarwin) then ''
      vim.g.sqlite_clib_path = '${pkgs.sqlite.out}/lib/libsqlite3.dylib'

      return {}
    '' else ''
      vim.g.sqlite_clib_path = '${pkgs.sqlite.out}/lib/libsqlite3.so'

      return {};
    '';
}
