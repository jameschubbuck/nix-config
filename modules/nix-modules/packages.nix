# Install some packages
{
  pkgs,
  config,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  documentation.nixos.enable = false;
  environment.systemPackages = with pkgs; [
    nautilus
    pavucontrol
    tor-browser
    baobab
    jq
    geekbench
  ];
}
