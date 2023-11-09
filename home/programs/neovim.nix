{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    extraPython3Packages = pyPkgs: with pkgs; [
      (python3.pkgs.toPythonModule (apache-airflow.pythonPackages.apache-airflow.override {
        enabledProviders = [
          # "amazon"
          "http"
          # "slack"
          "ssh"
        ];
      }))
    ];
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;
  };

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
