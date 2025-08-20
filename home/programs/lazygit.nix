{
  inputs,
  outputs,
  lib,
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
        paging = {
          pager = "delta --dark --paging=never";
        };

        autoForwardBranches = "allBranches";
        ignoreWhitespaceInDiffView = true;
        renameSimilarityThreshold = 20;
        overrideGpg = true;
      };

      os = {
        edit = "~/.config/lazygit/nvim.sh {{filename}}";
        editInTerminal = true;
      };

      services = {
        "whistler.ghe.com" = "github:whistler.ghe.com";
      };

      quitOnTopLevelReturn = true;
      notARepository = "skip";
      promptToReturnFromSubprocess = false;
    };
  };

  xdg.configFile."lazygit/nvim.sh" = {
    source = ../../assets/nvim.sh;
  };
}
