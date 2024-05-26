
# rpi 4 config:

getting an initial build with: https://github.com/Robertof/nixos-docker-sd-image-builder


nix flake init --experimental-features 'nix-command flakes'


try out performance of this option:

# also try out:  hardware.raspberry-pi."4".fkms-3d.enable = true;??

hardware.raspberry-pi."4".fkms-3d.enable = true;

pactl unload-module module-native-protocol-tcp


systemd.services.pulseaudio-tcp = {
description = "PulseAudio TCP Module Loader";
after = [ "network.target" "pulseaudio.service" ];
requires = [ "pulseaudio.service" ];
wantedBy = [ "multi-user.target" ];
serviceConfig = {
ExecStart = "${pkgs.pulseaudio}/bin/pactl load-module module-native-protocol-tcp port=4713 listen=0.0.0.0 auth-anonymous=true";
Type = "oneshot";
RemainAfterExit = true;
};
};


[user@rpi-silver-nixos:/



journalctl -u pulseaudio-tcp
sudo systemctl show pulseaudio-tcp
sudo systemctl --user  status pulseaudio-tcp

journalctl -u pulseaudio-tcp
sudo systemctl show pulseaudio-tcp
sudo systemctl status pulseaudio-tcp-monitor
journalctl -u pulseaudio-tcp-monitor



pactl list modules | grep module-native-protocol-tcp > /dev/null || pactl unload-module module-native-protocol-tcp

sudo systemctl restart pulseaudio-tcp

let
script = pkgs.writeShellScriptBin "pulseaudio-tcp-monitor" ''
if pactl list modules | grep -q 'module-native-protocol-tcp'; then
echo "Module already active. Unloading..."
pactl unload-module module-native-protocol-tcp || true
echo "Module unloaded successfully."
fi
    echo "Starting new client:"
    pactl load-module module-native-protocol-tcp port=4713 listen=0.0.0.0 auth-anonymous=true
'';
in$ which pactl
/run/current-system/sw/bin/pactl




systemd.user.services.pulseaudio-tcp = {
description = "PulseAudio TCP Module";
after = [ "network.target" ];
#wantedBy = [ "multi-user.target" ];
serviceConfig = {
Type = "simple";
ExecStartPre = "/run/current-system/sw/bin/sleep 10";
ExecStart = "/home/user/config/pulseaudio-tcp.sh";
Restart = "no";
};
};


pactl load-module module-zeroconf-publish

module-zeroconf-discover
module-zeroconf-publish 

load-module unmodule-native-protocol-tcp


pactl list modules | grep module-native-protocol-tcp