{
  lib,
  pkgs,
  ...
}:
{
  environment = lib.mkMerge [
    {
      enableAllTerminfo = true;

      etc.pythonrc.text = /* python */ ''
        import sys


        def _setup_history():
            import atexit
            import os
            import readline
            from pathlib import Path

            env_path = os.environ.get("PYTHON_HISTORY")
            if env_path:
                history_file = Path(env_path)
            else:
                state_home = os.environ.get("XDG_STATE_HOME") or Path.home() / ".local" / "state"
                history_file = Path(state_home) / "python" / "history"

            history_file.parent.mkdir(parents=True, exist_ok=True)

            if history_file.is_file():
                try:
                    readline.read_history_file(history_file)
                except OSError:
                    pass

            readline.set_history_length(10_000)

            prev_length = readline.get_current_history_length()

            def _save_history():
                try:
                    new_length = readline.get_current_history_length()
                    readline.append_history_file(new_length - prev_length, str(history_file))
                except OSError:
                    pass

            atexit.register(_save_history)


        if sys.version_info < (3, 13):
            _setup_history()

        del sys, _setup_history
      '';

      profiles = [ "\$HOME/.local/state/nix/profile" ];

      shells = [ pkgs.fish ];

      variables = {
        HISTFILE = "\$HOME/.local/state/bash/history";
        PYTHONSTARTUP = "/etc/pythonrc";
      };
    }

    (lib.optionalAttrs pkgs.stdenv.isDarwin {
      systemPath = [ "\$HOME/.local/bin" ];
    })

    (lib.optionalAttrs pkgs.stdenv.isLinux {
      localBinInPath = true;
    })
  ];

  programs.fish = {
    enable = true;
    useBabelfish = true;
  };
}
