{
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };

    displayManager = {
      lightdm.enable = true;
      defaultSession = "xfce+i3";
    };

    windowManager.i3 = {
      enable = true;
    };
  };

  services.autorandr.enable = true;
}
