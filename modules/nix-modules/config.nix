{...}: {
  imports = [
    ./hypr.nix
    ./bluetooth.nix
    ./boot.nix
    ./browser.nix
    ./graphics.nix
    ./hardware-configuration.nix
    ./locale.nix
    ./network.nix
    ./nix.nix
    ./packages.nix
    ./user.nix
    ./stylix.nix
    ./jellyfin.nix
    ./gaming.nix
    ./freshrss/freshrss.nix
  ];
}
