{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.git = {
    enable = true;

    delta = {
      enable = true;
      options = {
        features = "decorations";
        line-numbers = true;
        navigate = true;

        line-numbers-minus-style = "#ff6161";
        line-numbers-plus-style = "#61ff61";
        # minus-emph-style = syntax "#bd0000";
        # minus-style = syntax "#500000";
        # plus-emph-style = syntax "#007a23";
        # plus-style = syntax "#005217";
      };
    };

    extraConfig = {
      advice.detachedHead = false;

      core = {
        editor = "nvim";
      };

      diff = {
        algorithm = "histogram";
        colorMoved = "dimmed-zebra";
        colorMovedWs = "allow-indentation-change";
      };

      fetch = {
        prune = true;
        pruneTags = true;
      };

      format.pretty = "oneline";

      gpg = {
        format = "ssh";
      };

      grep.lineNumber = true;

      init.defaultBranch = "main";

      merge.conflictStyle = "diff3";

      pager.grep = false;

      pull.rebase = true;

      push.autoSetupRemote = true;

      rebase = {
        abbreviateCommands = true;
        autoSquash = true;
        autoStash = true;
        missingCommitsCheck = "warn";
      };

      rerere.enabled = true;
    };

    includes = [
      {
        condition = "gitdir:~/tensorfox/";
        contents = {
          user = {
            email = "utkarsh.gupta@tensorfox.com";
          };
        };
      }
    ];

    lfs = {
      enable = true;
    };

    signing = {
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIle2H+nw/MkMbQ8Ykzus/7WaLH5HqC/PGoquo+5QriF";
      signByDefault = true;
    };

    userEmail = "utkarshgupta137@gmail.com";
    userName = "Utkarsh Gupta";
  };
}
