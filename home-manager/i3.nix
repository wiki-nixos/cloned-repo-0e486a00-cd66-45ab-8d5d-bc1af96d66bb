{ pkgs, ... }:

let
  mod = "Mod4";
in
{
  xsession.windowManager.i3 = {
    enable = true;

    extraConfig = ''
      font pango:monospace 14
      workspace_layout tabbed
      # client.focused #4c7899 #2a3843 #ffffff #2e9ef4 #285577 old (maybe restore)
      client.focused #8cb2d9 #6a7883 #ffffff #6ec1f6 #6897b7
      client.unfocused #737373 #626262 #cccccc #646464 #737373
    '';

    config = {
      bars = [{
        fonts = [ "DejaVu Sans Mono, FontAwesome 15" ];
        position = "top";
        statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
      }];

      modifier = mod;
      keybindings = {
        "${mod}+Shift+F1" = "exec --no-startup-id \"xset dpms force off\"";

        # start terminal
        "${mod}+Return" = "exec --no-startup-id \"exo-open --launch TerminalEmulator\"";

        # Right Hand:
        # Focus
        "${mod}+n" = "focus left";
        "${mod}+g" = "focus up";
        "${mod}+r" = "focus down";
        "${mod}+t" = "focus right";

        # Move
        "${mod}+Shift+n" = "move left";
        "${mod}+Shift+g" = "move up";
        "${mod}+Shift+r" = "move down";
        "${mod}+Shift+t" = "move right";

        # Left Hand:
        # Focus
        "${mod}+u" = "focus left";
        "${mod}+v" = "focus up";
        "${mod}+i" = "focus down";
        "${mod}+a" = "focus right";

        # Move
        "${mod}+Shift+u" = "move left";
        "${mod}+Shift+v" = "move up";
        "${mod}+Shift+i" = "move down";
        "${mod}+Shift+a" = "move right";

        # legacy
        # focus
        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";

        # move
        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";

        # workspaces:
        "${mod}+1" = "workspace 1";
        "${mod}+2" = "workspace 2";
        "${mod}+3" = "workspace 3";
        "${mod}+4" = "workspace 4";
        "${mod}+5" = "workspace 5";
        "${mod}+6" = "workspace 6";
        "${mod}+7" = "workspace 7";
        "${mod}+8" = "workspace 8";
        "${mod}+9" = "workspace 9";
        "${mod}+0" = "workspace 10";


        "${mod}+Shift+1" = "move container to workspace 1";
        "${mod}+Shift+2" = "move container to workspace 2";
        "${mod}+Shift+3" = "move container to workspace 3";
        "${mod}+Shift+4" = "move container to workspace 4";
        "${mod}+Shift+5" = "move container to workspace 5";
        "${mod}+Shift+6" = "move container to workspace 6";
        "${mod}+Shift+7" = "move container to workspace 7";
        "${mod}+Shift+8" = "move container to workspace 8";
        "${mod}+Shift+9" = "move container to workspace 9";
        "${mod}+Shift+0" = "move container to workspace 10";

        # Arbeitsbereich nach rechts/links wechseln
        # right hand
        "${mod}+f" = "workspace next";
        "${mod}+h" = "workspace prev";
        # left hand
        "${mod}+l" = "workspace next";
        "${mod}+x" = "workspace prev";

        "${mod}+shift+q" = "kill";

        "${mod}+Shift+c" = "restart";
        "${mod}+Shift+e" = "exec \"i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'\"";

        # "${mod}+u" = "exec --no-startup-id dmenu_run";

        "${mod}+s" = "split h";
        "${mod}+Shift+s" = "layout splith";

        "${mod}+y" = "split v";
        "${mod}+Shift+y" = "layout splitv";


        "${mod}+m" = "fullscreen toggle";

        "${mod}+b" = "layout stacking";
        "${mod}+comma" = "layout tabbed";
        "${mod}+space" = "floating toggle";
        # TODO what is this?? "${mod}+Shift+space" = "focus mode_toggle";
      };
    };
  };
}
