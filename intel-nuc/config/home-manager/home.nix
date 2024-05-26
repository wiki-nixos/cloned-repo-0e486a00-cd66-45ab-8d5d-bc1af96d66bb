{ config, pkgs, nur, ... }:

let
  mod = "Mod4";

in 
{
programs.i3status-rust = {
    enable = true;
    bars = {
      top = {
        blocks = [
         {
           block = "time";
           #format = "%a %d/%m %k:%M %p";
           interval = 1;
           format = " $timestamp.datetime(f:'%Y.%m.%d %H:%M:%S') ";
         }
         {
           block = "cpu";
         }
       ];
      };
    };
  };


    # todo move to own file
    xsession.windowManager.i3 = {
        enable = true;
        config = {


 bars = [
        {

          fonts = ["DejaVu Sans Mono, FontAwesome 15"];
          position = "top";
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
        }
      ];





            modifier = mod;
         keybindings = {
            # Focus
        "${mod}+n" = "focus left";
        "${mod}+g" = "focus down";
        "${mod}+r" = "focus up";
        "${mod}+t" = "focus right";

        "${mod}+Left" = "focus left";
      "${mod}+Down" = "focus down";
      "${mod}+Up" = "focus up";
      "${mod}+Right" = "focus right";

            # Move
          "${mod}+Shift+n" = "move left";
          "${mod}+Shift+g" = "move down";
          "${mod}+Shift+r" = "move up";
          "${mod}+Shift+t" = "move right";
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
"${mod}+f" = "workspace next";
"${mod}+h" = "workspace prev";

   "${mod}+shift+q" = "kill";



 "${mod}+Shift+c" = "restart";
  "${mod}+Shift+e" = "exec \"i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'\"";

 "${mod}+u" = "exec --no-startup-id dmenu_run";
 
"${mod}+s" = "split h";
  "${mod}+y" = "split v";
  "${mod}+m" = "fullscreen";

  "${mod}+Shift+s" = "layout splith";
  "${mod}+Shift+y" = "layout splitv";
  "${mod}+Shift+b" = "layout stacking";
  "${mod}+Shift+comma" = "layout tabbed";
  "${mod}+space" = "floating toggle";
  # TODO what is this?? "${mod}+Shift+space" = "focus mode_toggle";

        };
        };
     };

  home.username = "user";
  home.homeDirectory = "/home/user";

  home.stateVersion = "23.05";

  home.packages = [
    pkgs.htop
    pkgs.vim
    pkgs.wget
    pkgs.tree
    pkgs.git


    pkgs.barrier # keyboard and mouse sharing

  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/user/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
    TERMINAL = "konsole";
  };



  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
