{ inputs, outputs, lib, config, pkgs, ... }: {
  xresources = {
    path = "${config.xdg.configHome}/X11/xresources";
  };

  xsession = {
    enable = true;

    preferStatusNotifierItems = true;

    profilePath = "${config.xdg.configHome}/X11/xprofile";

    scriptPath = "${config.xdg.cacheHome}/X11/xsession";

    windowManager.i3 = {
      enable = true;

      config =
        let
          cfg = config.xsession.windowManager.i3;
        in
        {
          assigns = { };

          bars = [ ];

          defaultWorkspace = "workspace number 1";

          focus = { };

          keybindings = {
            # Fn keys
            "XF86AudioMute" = "exec --no-startup-id amixer -q set Master toggle";
            "XF86AudioLowerVolume" = "exec --no-startup-id amixer -q set Master 5%- unmute";
            "XF86AudioRaiseVolume" = "exec --no-startup-id amixer -q set Master 5%+ unmute";
            "XF86AudioMicMute" = "exec --no-startup-id amixer -q set Capture toggle";
            "XF86MonBrightnessUp" = "exec --no-startup-id brillo -r -A 16";
            "XF86MonBrightnessDown" = "exec --no-startup-id brillo -r -U 16";
            "XF86Calculator" = "exec --no-startup-id gnome-calculator";
            "Print" = "exec --no-startup-id gnome-screenshot -i";
            "XF86AudioPlay" = "exec --no-startup-id playerctl play-pause";
            "XF86AudioStop" = "exec --no-startup-id playerctl stop";
            "XF86AudioPrev" = "exec --no-startup-id playerctl previous";
            "XF86AudioNext" = "exec --no-startup-id playerctl next";

            # i3
            "${cfg.config.modifier}+Return" = "exec ${cfg.config.terminal}";
            "${cfg.config.modifier}+Shift+q" = "kill";
            "${cfg.config.modifier}+d" = "exec ${cfg.config.menu}";

            "Mod1+h" = "focus left";
            "Mod1+j" = "focus down";
            "Mod1+k" = "focus up";
            "Mod1+l" = "focus right";

            "${cfg.config.modifier}+Shift+h" = "move left";
            "${cfg.config.modifier}+Shift+j" = "move down";
            "${cfg.config.modifier}+Shift+k" = "move up";
            "${cfg.config.modifier}+Shift+l" = "move right";

            "${cfg.config.modifier}+backslash" = "split h";
            "${cfg.config.modifier}+Shift+backslash" = "split v";
            "${cfg.config.modifier}+f" = "fullscreen toggle";

            "${cfg.config.modifier}+s" = "layout stacking";
            "${cfg.config.modifier}+w" = "layout tabbed";
            "${cfg.config.modifier}+e" = "layout toggle split";

            "${cfg.config.modifier}+Shift+space" = "floating toggle";
            "${cfg.config.modifier}+space" = "focus mode_toggle";

            "${cfg.config.modifier}+p" = "focus parent";
            "${cfg.config.modifier}+c" = "focus child";

            "${cfg.config.modifier}+minus" = "scratchpad show";
            "${cfg.config.modifier}+Shift+minus" = "move scratchpad";

            "${cfg.config.modifier}+h" = "workspace prev";
            "${cfg.config.modifier}+l" = "workspace next";
            "${cfg.config.modifier}+1" = "workspace number 1";
            "${cfg.config.modifier}+2" = "workspace number 2";
            "${cfg.config.modifier}+3" = "workspace number 3";
            "${cfg.config.modifier}+4" = "workspace number 4";
            "${cfg.config.modifier}+5" = "workspace number 5";
            "${cfg.config.modifier}+6" = "workspace number 6";
            "${cfg.config.modifier}+7" = "workspace number 7";
            "${cfg.config.modifier}+8" = "workspace number 8";
            "${cfg.config.modifier}+9" = "workspace number 9";
            "${cfg.config.modifier}+0" = "workspace number 10";

            "${cfg.config.modifier}+Shift+1" =
              "move container to workspace number 1";
            "${cfg.config.modifier}+Shift+2" =
              "move container to workspace number 2";
            "${cfg.config.modifier}+Shift+3" =
              "move container to workspace number 3";
            "${cfg.config.modifier}+Shift+4" =
              "move container to workspace number 4";
            "${cfg.config.modifier}+Shift+5" =
              "move container to workspace number 5";
            "${cfg.config.modifier}+Shift+6" =
              "move container to workspace number 6";
            "${cfg.config.modifier}+Shift+7" =
              "move container to workspace number 7";
            "${cfg.config.modifier}+Shift+8" =
              "move container to workspace number 8";
            "${cfg.config.modifier}+Shift+9" =
              "move container to workspace number 9";
            "${cfg.config.modifier}+Shift+0" =
              "move container to workspace number 10";

            "${cfg.config.modifier}+Shift+c" = "reload";
            "${cfg.config.modifier}+Shift+r" = "restart";
            "${cfg.config.modifier}+Shift+e" =
              "exec i3-nagbar -t warning -m 'Do you want to exit i3?' -b 'Yes' 'i3-msg exit'";

            "${cfg.config.modifier}+r" = "mode resize";
          };

          menu = "${pkgs.rofi}/bin/rofi -show drun";

          modes = {
            resize = {
              h = "resize shrink width 10 px or 10 ppt";
              j = "resize grow height 10 px or 10 ppt";
              k = "resize shrink height 10 px or 10 ppt";
              l = "resize grow width 10 px or 10 ppt";
              Escape = "mode default";
              Return = "mode default";
              "${cfg.config.modifier}+r" = "mode default";
            };
          };

          modifier = "Mod4";

          startup = [
            { command = cfg.config.terminal; }
          ];

          terminal = "${pkgs.alacritty}/bin/alacritty";

          workspaceAutoBackAndForth = true;
        };
    };
  };
}
