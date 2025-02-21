{ pkgs, ... }: {
  imports = [
   ./emulation/fex/package.nix
  ];
  nixpkgs.config.allowUnsupportedSystem = true;
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [ 
    thunderbird 
    vlc
    obsidian  
    beeper
    nautilus 
    muvm
  ];
}
