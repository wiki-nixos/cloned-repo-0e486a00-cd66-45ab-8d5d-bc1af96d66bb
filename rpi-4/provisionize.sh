#!/usr/bin/env sh



RPI_IP_ADDRESS=...


ssh -i ~/.ssh/id_ed25519 nixos@192.168.1.162

# run on server:
  sudo nixos-generate-config


  cp -r config ...



ssh -i ~/.ssh/id_ed25519 user@192.168.1.162
ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no user@192.168.1.162
