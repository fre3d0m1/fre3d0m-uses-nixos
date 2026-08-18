{
  description = "fre3d0m's NixOS configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs,... }@inputs: {
    nixosConfigurations = {
      desktop-fast = nixpkgs.lib.nixosSystem {
        modules = [ 
            ./hosts/desktop-fast
        ];
        specialArgs = {
          inherit inputs;
        };
      };
      desktop = nixpkgs.lib.nixosSystem {
        modules = [ 
            ./hosts/desktop
        ];
        specialArgs = {
          inherit inputs;
        };
      };
    };
  };
}
