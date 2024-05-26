[
 {
      command = "firefox";
      notification = true;
    }
    {
      command = "fcast-receiver";
    }

  { command = "pactl load-module module-tunnel-sink server=tcp:192.168.1.162:4713";
    notification = true;
    }
]
