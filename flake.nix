{
  description = "fre3d0m's NixOS configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, stylix, ... }@inputs: {
    nixosConfigurations.fre3d0m-uses-nixos = nixpkgs.lib.nixosSystem {
      modules = [ 
          stylix.nixosModules.stylix
          ./hosts/desktop
      ];
      specialArgs = {
        inherit inputs;
      };
    };
  };
}
