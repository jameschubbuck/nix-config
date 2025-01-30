{
  pkgs,
  lib,
  ...
}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    #theme = lib.mkForce ./config.rasi;
  };
}
