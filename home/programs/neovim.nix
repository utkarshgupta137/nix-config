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

  xdg.configFile."nvim/lua/user/plugins/sqlite.lua".text = ''
    vim.g.sqlite_clib_path = '${pkgs.sqlite.out}/lib/libsqlite3.dylib'

    return {}
  '';
}
