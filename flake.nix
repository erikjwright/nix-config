{
  description = "Erik's Nix Systems";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    # nix-darwin = {
    # url = "github:LnL7/nix-darwin";
    # inputs.nixpkgs.follows = "nixpkgs";
    # };
    # home-manager = {
    # url = "github:nix-community/home-manager";
    # inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs =
    {
      self,
      nixpkgs,
      # home-manager,
      # nix-darwin,
      ...
    }:
    {
      nixosConfigurations = {
        kronos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./nixos/configuration.nix
          ];
        };
      };

      # darwinConfigurations = {
      # rhea = nix-darwin.lib.darwinSystem {
      # system = "aarch64-darwin";
      # modules = [
      # ./darwin/configuration.nix
      # ];
      # };
      # };
    };
}
