{
  description = "Erik's Systems";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    zen-browser.url = "github:MarceColl/zen-browser-flake";
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
      neovim-nightly-overlay,
      zen-browser,
    }:
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
         system = "x86_64-linux";
          modules = [
            ./nixos/configuration.nix
            home-manager.nixosModules.home-manager
              {
	        home-manager = {
		  backupFileExtension = "~";
		  useGlobalPkgs = true;
	          useUserPackages = true;
	          users.erik = import ./nixos/home.nix;
	          extraSpecialArgs = {
                    inherit neovim-nightly-overlay;
                    inherit zen-browser;
                  };
		};
	      }
          ];
        };
      };

      darwinConfigurations = {
        darwin = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./darwin/configuration.nix
            home-manager.darwinModules.home-manager
              {
		users.users.erik = {
  isNormalUser  = true;
  home  = "/Users/erik";
  description  = "Erik Wright";
  extraGroups  = [ "wheel" "networkmanager" ];
  # openssh.authorizedKeys.keys  = [ "ssh-dss AAAAB3Nza... alice@foobar" ];
};
	       home-manager = {
		  backupFileExtension = "~";
		  useGlobalPkgs = true;
		  useUserPackages = true;
		  users.erik = import ./darwin/home.nix;
		  extraSpecialArgs = {
                    inherit neovim-nightly-overlay;
                  };
	      };
						}
          ];
        };
      };
    };
}
