{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    stylix.url = "github:danth/stylix";
    nixos-apple-silicon.url = "github:tpwrules/nixos-apple-silicon";
  };
  outputs = { self, nixpkgs, home-manager, stylix, nixos-apple-silicon, ...}:
  let 
    overlays = [
      self.overlays.default
    ];
  in {
    overlays.default = final: prev: {
      libkrun = final.callPackage ./modules/nix-modules/emulation/libkrun { };
      muvm = final.callPackage ./modules/nix-modules/emulation/muvm { };
      virglrenderer = prev.virglrenderer.overrideAttrs (old: {
        src = final.fetchurl {
          url = "https://gitlab.freedesktop.org/asahi/virglrenderer/-/archive/asahi-20241205.2/virglrenderer-asahi-20241205.2.tar.bz2";
          hash = "sha256-mESFaB//RThS5Uts8dCRExfxT5DQ+QQgTDWBoQppU7U=";
        };
        mesonFlags = old.mesonFlags ++ [ (final.lib.mesonOption "drm-renderers" "asahi-experimental") ];
      });
    };
    nixosConfigurations = {
      "mba" = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [
          {
            nixpkgs.overlays = overlays;
          }
          ./modules/nix-modules/configuration.nix
          stylix.nixosModules.stylix
          nixos-apple-silicon.nixosModules.default
          home-manager.nixosModules.home-manager { 
            home-manager.useGlobalPkgs = false;
            home-manager.useUserPackages = true;
            home-manager.users.james = import ./modules/hm-modules/configuration.nix;
            #home-manager.extraSpecialArgs = { inherit inputs; };
          }
        ];
      };
    }; 
  };
}
