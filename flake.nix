{
  description = "hachi system flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-25.05";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      url = "github:kaylorben/nixcord";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      spicetify-nix,
      nixcord,
      ...
      }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
	  specialArgs = { inherit inputs; };
          modules = [
            ./nixos/configuration.nix
          ];
        };
      };
      homeConfigurations = {
        hachi = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
	  extraSpecialArgs = { inherit inputs; };
          modules = [
          ./home-manager/home.nix
          ];
        };
      };
    };
}
