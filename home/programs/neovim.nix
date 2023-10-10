{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    extraPython3Packages = pyPkgs: with pkgs; [
      (python3.pkgs.toPythonModule (apache-airflow.pythonPackages.apache-airflow.override {
        enabledProviders = [
          # "airflow"
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
}
