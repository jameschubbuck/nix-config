{ ... }: {
  networking = {
    hostName = "jupiter";
    networkmanager.enable = true;
    interfaces."enp12s0".wakeOnLan.enable = true;
  };
}
