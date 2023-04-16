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
        editCommand = "~/.config/lazygit/nvim.sh";
        editCommandTemplate = "{{editor}} {{filename}} {{line}}";
      };

      quitOnTopLevelReturn = true;
    };
  };

  xdg.configFile."lazygit/nvim.sh" = {
    source = ../../assets/nvim.sh;
  };
}
