REMOTE_IP = nixos-intel-nuc
FLAKE_NAME = nixos-intel-nuc

sync:
	scp -r -o StrictHostKeyChecking=no /home/user/projects/nix-config/intel-nuc/config/* user@$(REMOTE_IP):~/config

remote-build:
	ssh -i -o StrictHostKeyChecking=no user@$(REMOTE_IP) 'cd ~/config && sudo nixos-rebuild --flake ".#$(FLAKE_NAME)" switch'

all:
	make sync
	make remote-build
