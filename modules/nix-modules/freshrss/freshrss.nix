{pkgs, ...}: {
  services = {
    freshrss = {
      enable = true;
      extensions = [
        pkgs.freshrss-extensions.youtube
      ];
      baseUrl = "http://192.168.0.102";
      #authType = "none";
      defaultUser = "james";
      passwordFile = "/config/assets/secrets/freshrss";
    };
  };
  networking.firewall.allowedTCPPorts = [80];
}
