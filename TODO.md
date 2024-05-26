 # TODO
 

## rpi-silver pulseaudio


try out performance of this option:

# also try out:  hardware.raspberry-pi."4".fkms-3d.enable = true;??
hardware.raspberry-pi."4".fkms-3d.enable = true;

just wait for fucking 5 seconds until the audio server has started...

...need to run.. to make it work after autostart?:
pactl list modules | grep module-native-protocol-tcp

todo:
- [ ] rpi audio: fiverr guy schreiben (sobald 2. gehalt da ist)
- [ ] -> er soll bluetooth einrichten
- [ ] und den autostart fixen
ich bin zu blöd dafür

- [ ] vllt noch pipewire etc. mach es schön
- [ ] authentication?? -> eher später mit headscale usw


## intel nuc:


