{
  programs.i3status-rust = {
    enable = true;

    bars.top.blocks = [
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
}
