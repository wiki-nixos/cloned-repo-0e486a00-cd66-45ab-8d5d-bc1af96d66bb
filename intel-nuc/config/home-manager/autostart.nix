{ pkgs, ... }:


[
  {
    command = "${pkgs.firefox}/bin/firefox";
    notification = true;
  }
]
