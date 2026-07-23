{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations.fre3d0m-uses-nixos = nixpkgs.lib.nixosSystem {
      modules = [ 
      	  ./configuration.nix

	  home-manager.nixosModules.home-manager
	  {
	     home-manager.useGlobalPkgs = true;
	     home-manager.useUserPackages = true;
	     home-manager.backupFileExtension = "backup";
	     home-manager.users.fre3d0m = import ./home.nix;
	  }
      ];
    };
  };
}
