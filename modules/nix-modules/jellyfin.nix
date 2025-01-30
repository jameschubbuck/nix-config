# Enable and configure Jellyfin
{ pkgs, ... }: {
    environment.systemPackages = [
        pkgs.jellyfin
        #pkgs.jellyfin-web
        #pkgs.jellyfin-ffmpeg
    ];
    services.jellyfin = {
        enable = true;
        openFirewall = true;
        user="james";
    };
}
