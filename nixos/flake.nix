{
  description = "Hello flakes!";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # nixpkgs.url = "nixpkgs/nixos-23.11";
    # nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    # home-manager.url = "github:nix-community/home-manager/release-23.11";
    # home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
          ];
          specialArgs = {
            inherit pkgs-unstable;
          };
        };
      };
      homeConfigurations = {
        cagatay = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home.nix
          ];
          extraSpecialArgs = {
            inherit pkgs-unstable;
          };
        };
      };
    };
}
