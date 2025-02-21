{ config, pkgs, lib, ... }:

let
  commonConfig = {
    wrapInterpreterInShell = false;
    interpreter = "${pkgs.fex}/bin/FEXInterpreter";
    offset = 0;
    mask = ''\xff\xff\xff\xff\xff\xfe\xfe\x00\x00\x00\x00\xff\xff\xff\xff\xff\xfe\xff\xff\xff'';
    matchCredentials = true;
    fixBinary = true;
    preserveArgvZero = true;
  };
in {
  environment.systemPackages = with pkgs; [
    fex
  ];
  boot.binfmt.registrations.FEX-x86 = commonConfig // {
    magicOrExtension = ''\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x03\x00'';
  };

  boot.binfmt.registrations.FEX-x86_64 = commonConfig // {
    magicOrExtension = ''\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x3e\x00'';
  };

  nix.settings.extra-sandbox-paths = [
    "/run/binfmt"
    "${pkgs.fex}"
  ];

  nix.settings.extra-platforms = [
    "i686-linux"
    "x86_64-linux"
  ];
}
