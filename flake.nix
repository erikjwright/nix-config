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
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    zen-browser.url = "github:MarceColl/zen-browser-flake";
  };

  outputs =
    {
      self,
      nixpkgs,
      # home-manager,
      # nix-darwin,
      neovim-nightly-overlay,
      zen-browser,
      ...
    }:
    {
      nixosConfigurations = {
        kronos = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit neovim-nightly-overlay;
            inherit zen-browser;
          };
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
