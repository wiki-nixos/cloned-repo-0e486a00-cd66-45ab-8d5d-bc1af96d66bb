{ config, pkgs, nur, ... }:

let
  ideaUltimateModified = import ./apps/jetbrains-idea-ultimate-override-neo2.nix { inherit pkgs; };
  clionModified = import ./apps/jetbrains-clion-override-neo2.nix { inherit pkgs; };
  mod = "Mod4";

in 
{
programs.i3status-rust = {
    enable = true;
    bars = {
      top = {
        blocks = [
          {
                       block = "sound";
          }
        {
                    block = "speedtest";
                    interval = 600;

                     # format = "$ping.eng(w:4)";
                     format = " ^icon_ping $ping ^icon_net_down $speed_down ^icon_net_up $speed_up ";

         }

{
block = "disk_space";
}
         {
                                       block = "battery";
                                    }
                  {
                             block = "temperature";
                  }
          {
                      block = "amd_gpu";
           }
         {
           block = "cpu";
         }
         {
                    block = "time";
                    interval = 1;
                    format = " $timestamp.datetime(f:'%Y.%m.%d %H:%M:%S') ";
                  }
       ];
      };
    };
  };


    # todo move to own file
    xsession.windowManager.i3 = {
        enable = true;

        extraConfig = ''
        font pango:monospace 14
        workspace_layout tabbed
        client.focused #4c7899 #2a3843 #ffffff #2e9ef4 #285577
        '';
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

  imports = [
     ./apps/neovim.nix
     ./modules/protonmail-bridge.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should

  home.username = "user";
  home.homeDirectory = "/home/user";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
    pkgs.htop
    pkgs.vim
    pkgs.wget
    pkgs.tree
    pkgs.git
    pkgs.rpi-imager

    pkgs.element-desktop
    pkgs.protonmail-bridge
    pkgs.thunderbird

pkgs.mullvad-browser

# open source (https://github.com/th-ch/youtube-music)
    pkgs.youtube-music
    #pkgs.jetbrains.idea-ultimate
    ideaUltimateModified
    clionModified
    nur.repos.mic92.hello-nur  

    pkgs.joplin-desktop
    pkgs.signal-desktop
    pkgs.slack

    pkgs.qbittorrent
    pkgs.vlc



    pkgs.barrier # keyboard and mouse sharing
    pkgs.libreoffice


    pkgs.speedtest-cli


    pkgs.monero-gui
    # dev
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
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
  };



  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
