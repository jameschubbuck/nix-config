{
  inputs = { 
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; 
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager, stylix, nvf, ... }@inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    configModule = import ./modules/nvf-modules/config.nix;
    customNeovim = nvf.lib.neovimConfiguration { inherit pkgs; modules = [configModule];};
  in {
    packages.${system}.my-neovim = customNeovim.neovim; 
    nixosConfigurations = {
      "james" = nixpkgs.lib.nixosSystem {
        modules = [
	  {environment.systemPackages = [customNeovim.neovim];}
          ./modules/nix-modules/config.nix
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.james = import ./modules/hm-modules/configuration.nix;
            home-manager.extraSpecialArgs = {inherit inputs; };
          }
        ];
      };
    };
  };
}
