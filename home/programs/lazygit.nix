{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        theme = {
          selectedLineBgColor = [ "reverse" ];
          selectedRangeBgColor = [ "reverse" ];
        };

        showIcons = true;
      };

      git = {
        paging = {
          colorArg = "always";
          pager = "delta --paging=never";
        };
      };

      os = {
        edit = "~/.config/lazygit/nvim.sh {{filename}}";
        editInTerminal = true;
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
