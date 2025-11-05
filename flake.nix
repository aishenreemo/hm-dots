{
  description = "Home Manager configuration of aivan";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixgl.url = "github:nix-community/nixGL";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    }; 
  };

  outputs = { nixpkgs, nixgl, home-manager, ... }:
    let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfreePredicate = drv: builtins.elem drv.pname [
        ];
      };
  };
  custom-pkgs = import ./pkgs { inherit pkgs; };
  in
  {
    homeConfigurations."aivan" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [ 
        ./fish.nix
        ./home.nix 
        ./alacritty.nix
        ./firefox.nix
        ./waybar.nix
        ./hyprland.nix
        ./wofi.nix
        ./mako.nix
        ./tmux.nix
        ./fastfetch.nix
      ];

      extraSpecialArgs = {
        inherit nixgl;
        inherit custom-pkgs;
      };
    };
  };
}
