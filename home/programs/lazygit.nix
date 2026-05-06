{
  config,
  pkgs,
  ...
}:
{
  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        theme = {
          selectedLineBgColor = [ "reverse" ];
          selectedRangeBgColor = [ "reverse" ];
        };

        showNumstatInFilesView = true;
        nerdFontsVersion = "3";
        commitHashLength = 7;
        showBranchCommitHash = true;
        showDivergenceFromBaseBranch = "arrowAndNumber";
      };

      git = {
        pagers = [
          {
            pager = "delta --dark --paging=never";
          }
        ];

        autoForwardBranches = "allBranches";
        ignoreWhitespaceInDiffView = true;
        renameSimilarityThreshold = 20;
        overrideGpg = true;
      };

      os = {
        edit = "${config.home.homeDirectory}/.config/lazygit/nvim.sh {{filename}}";
        editInTerminal = true;
      };

      quitOnTopLevelReturn = true;
      notARepository = "skip";
      promptToReturnFromSubprocess = false;
    };
  };

  xdg.configFile."lazygit/nvim.sh".source = pkgs.writeShellScript "nvim.sh" /* sh */ ''
    if [ "''${NVIM_LISTEN_ADDRESS + x}" != "" ] || [ "''${NVIM + x}" != "" ]; then
      nvr --remote-wait "$1"
    else
      nvim "$1"
    fi
  '';
}
