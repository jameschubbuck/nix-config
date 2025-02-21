{ config, lib, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
    #./apple-silicon-support
    ./stylix.nix
    ./locale.nix
    ./packages.nix
    ./fonts.nix
    ./powerbutton.nix
    ./emulation/emulation.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = false;
  };

  #environment.variables = {
  #  GDK_BACKEND = "x11";
  #};

  hardware = {
    graphics.enable = true;
    asahi = {
      peripheralFirmwareDirectory = ./firmware;
      useExperimentalGPUDriver = true;
      #experimentalGPUInstallMode = "replace";
    };
  };

  networking.wireless.iwd = {
    enable = true;
    settings.General.EnableNetworkConfiguration = true;
  };

  # set a password with ‘passwd’.
  users.users.james = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };


  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
  programs.uwsm.enable = true;
  services.getty = {
    autologinUser = "james";
  };

  nix.settings.experimental-features = [ "flakes" "nix-command" ];
  system.stateVersion = "25.05";
}
