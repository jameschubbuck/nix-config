{...}: {
  home = {
    username = "james";
    homeDirectory = "/home/james";
    stateVersion = "24.11";
  };
  programs.home-manager.enable = true;
  imports = [
    ./hyprland.nix
    ./shell.nix
    ./hyprlock.nix
    ./git.nix
    ./oh-my-posh.nix
    ./rofi/rofi.nix
  ];
}
