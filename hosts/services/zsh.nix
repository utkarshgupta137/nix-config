{ inputs, outputs, lib, config, pkgs, ... }: {
  environment = lib.mkMerge [
    {
      pathsToLink = [ "/libexec" "/share/zsh" ];

      profiles = [
        "\$HOME/.local/state/nix/profile"
      ];

      shells = [ pkgs.zsh ];

      variables = {
        ZDOTDIR = "\$HOME/.config/zsh";
      };
    }

    # (lib.optionalAttrs (pkgs.stdenv.isLinux) {
    #   localBinInPath = true;
    # })
  ];

  programs.zsh = {
    enable = true;
    enableBashCompletion = true;
  };
}
