hello:
	echo "Hello, World"

sync:
	scp -r -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no /home/user/projects/nix-config/rpi-4/config/* user@192.168.1.162:~/config

remote-build:
	ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no user@192.168.1.162 'cd ~/config && sudo nixos-rebuild --flake .#rpi-silver-nixos-sd-boot switch'
