{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  environment = {
    etc.pythonrc.text = /* python */ ''
      def is_vanilla() -> bool:
          import sys
          return not hasattr(__builtins__, '__IPYTHON__') and 'bpython' not in sys.argv[0]


      def setup_history():
          import os
          import atexit
          import readline
          from pathlib import Path

          if state_home := os.environ.get('XDG_STATE_HOME'):
              state_home = Path(state_home)
          else:
              state_home = Path.home() / '.local' / 'state'

          history: Path = state_home / 'python' / 'history'

          readline.read_history_file(str(history))
          atexit.register(readline.write_history_file, str(history))


      if is_vanilla():
          setup_history()
    '';

    profiles = [ "\$HOME/.local/state/nix/profile" ];

    shells = [ pkgs.fish ];

    variables = {
      HISTFILE = "\$HOME/.local/state/bash/history";
      PYTHONSTARTUP = "/etc/pythonrc";
    };
  };

  programs.fish = {
    enable = true;
    useBabelfish = true;
  };
}
