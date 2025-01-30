#sudo nix-env --list-generations --profile /nix/var/nix/profiles/system
sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system
sudo nix-collect-garbage -d
sudo nix-store --gc