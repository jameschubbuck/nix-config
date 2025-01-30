{pkgs, ...}: {
  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;
  };
  programs.gamemode.enable = true;
  environment.systemPackages = with pkgs; [
    protonup
    bottles
    qbittorrent
  ];
  programs.steam.enable = true;
  programs.gamescope.enable = true;
}
