# Enable nix and set some specific settings
{ ... }: {
  nix.settings.experimental-features = ["nix-command" "flakes" ];
  system.stateVersion = "24.11";
}