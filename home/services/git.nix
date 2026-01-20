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

    settings = {
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
      };

      format.pretty = "oneline";

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

      user = {
        email = "utkarshgupta137@gmail.com";
        Name = "Utkarsh Gupta";
      };
    };

    includes = [
      {
        condition = "gitdir:~/cloudflare/";
        contents = {
          user = {
            email = "ugupta@cloudflare.com";
          };
        };
      }
    ];

    lfs = {
      enable = true;
    };

    signing = {
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIle2H+nw/MkMbQ8Ykzus/7WaLH5HqC/PGoquo+5QriF";
      format = "ssh";
      signByDefault = true;
    };
  };
}
