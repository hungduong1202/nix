{
  description = "Multi-system Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        packages = {
          homeConfigurations.zit1202 = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [
              ./home/zit1202.nix
            ];
          };
        };
      }
    );
}
