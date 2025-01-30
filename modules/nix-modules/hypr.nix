{ pkgs, ... }: {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
  programs.uwsm.enable = true;
  services.getty = {
    autologinUser = "james";
  };
  security.pam.services.hyprlock = {};
}
