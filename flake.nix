{
  description = "Cross-platform Home Manager setup (macOS + Linux)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = builtins.currentSystem;
      pkgs = import nixpkgs { inherit system; };
      username = "hung.duong";
      homeDir =
        if pkgs.stdenv.isDarwin then "/Users/${username}"
        else "/home/${username}";
    in {
      homeConfigurations.${username} =
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home/default.nix
            {
              home.username = username;
              home.homeDirectory = homeDir;
              home.stateVersion = "25.05";
            }
          ];
        };
    };
}
