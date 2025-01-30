# Enable Bluetooth management options
{pkgs, ...}:
{
   hardware.bluetooth.enable = true;
   hardware.bluetooth.powerOnBoot = true; 
   services.blueman.enable = true;

   # For some wonderful reason bluetooth is not automatically started by the powers that be. 
   # This is a dirty but functional fix - which is located in hyprland.nix's hm module
   # rfkill unblock bluetooth

   

   hardware.pulseaudio.enable = true;
   services.pipewire.enable = false;
}