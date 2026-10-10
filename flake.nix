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
  outputs =
    { nixpkgs, stylix, ... }@inputs:
    {
      nixosConfigurations = {
        desktop-fast = nixpkgs.lib.nixosSystem {
          modules = [
            stylix.nixosModules.stylix
            ./hosts/desktop-fast
          ];
          specialArgs = {
            inherit inputs;
          };
        };
        desktop = nixpkgs.lib.nixosSystem {
          modules = [
            stylix.nixosModules.stylix
            ./hosts/desktop
          ];
          specialArgs = {
            inherit inputs;
          };
        };
        laptop = nixpkgs.lib.nixosSystem {
          modules = [
            stylix.nixosModules.stylix
            ./hosts/laptop
          ];
          specialArgs = {
            inherit inputs;
          };
        };
        vm = nixpkgs.lib.nixosSystem {
          modules = [
            stylix.nixosModules.stylix
            ./hosts/vm
          ];
          specialArgs = {
            inherit inputs;
          };
        };
      };
    };
}
