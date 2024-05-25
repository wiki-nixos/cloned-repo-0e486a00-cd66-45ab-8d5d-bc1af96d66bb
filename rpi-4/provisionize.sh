#!/usr/bin/env sh



RPI_IP_ADDRESS=...


ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no nixos@192.168.1.162

scp -r -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no  config/*  nixos@192.168.1.162:~/config
ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no nixos@192.168.1.162 'cd ~/config; sudo nixos-rebuild --flake .#rpi-silver-nixos switch'

# run on server:??
  sudo nixos-generate-config

  cp -r config ...

ssh -i ~/.ssh/id_ed25519 user@192.168.1.162
ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no user@192.168.1.162
scp -r -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no  config/*  user@192.168.1.162:~/config



sudo nixos-rebuild --flake .#rpi-silver-nixos-sd-boot switch