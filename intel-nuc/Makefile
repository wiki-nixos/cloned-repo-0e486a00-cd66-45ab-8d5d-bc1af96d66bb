REMOTE_IP = 192.168.1.162
FLAKE_NAME = rpi-silver-nixos-sd-boot

sync:
	scp -r -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no /home/user/projects/nix-config/rpi-4/config/* user@$(REMOTE_IP):~/config

remote-build:
	ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no user@$(REMOTE_IP) 'cd ~/config && sudo nixos-rebuild --flake ".#$(FLAKE_NAME)" switch'

all:
	make sync
	make remote-build
