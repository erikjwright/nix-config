{
  description = "Erik's systems";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    nix-darwin.url = "github:LnL7/nix-darwin/nix-darwin-24.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    # zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      neovim-nightly-overlay,
    # zen-browser,
    }:
    # nixosConfigurations = {
    #      pamplemousse = nixpkgs.lib.nixosSystem {
    #        system = "aarch64-linux";
    #        modules = [
    #          ./configuration.nix
    #          ./raspi-configuration.nix
    #          { networking.hostname = "pamplemousse"; }
    #        ];
    #      };
    #      myComputer = nixpkgs.lib.nixosSystem {
    #        system = "x86_64-linux";
    #        modules = [
    #          ./configuration.nix
    #          ./pc-configuration.nix
    #          { networking.hostname = "mycomputer"; }
    #        ];
    #      }
    #    };
    let
      configuration =
        { pkgs, ... }:
        {
          # List packages installed in system profile. To search by name, run:
          # $ nix-env -qaP | grep wget
          environment.systemPackages = with pkgs; [
            bun
            chezmoi
            clang
            curl
            dbeaver-bin
            direnv
            eza
            fzf
            git
            inputs.neovim-nightly-overlay.packages.${system}.default
            nixfmt-rfc-style
            nodejs_22
            rustup
            starship
            # inputs.zen-browser.packages."${system}".default
            zoxide

          homebrew = {
            enable = true;
            onActivation.cleanup = "uninstall";
            taps = [
            ];
            brews = [
              "zsh-vi-mode"
              "zsh-autosuggestions"
            ];
            casks = [
              "1password"
              "1password-cli"
              "ghostty"
              "keybase"
              "mullvadvpn"
              "notion"
              "raycast"
              "zen-browser"
            ];
            masApps = {
              slack = 803453959;

              # useful for debugging macos key codes
              #key-codes = 414568915;
            };
          };

          # Add change default browser
          security.pam.enableSudoTouchIdAuth = true;

          system.keyboard.enableKeyMapping = true;
          system.keyboard.remapCapsLockToEscape = true;

          system.defaults = {
            # Add swap caps for esc
            dock.autohide = true;
            dock.mru-spaces = false;
            finder.AppleShowAllExtensions = true;
            finder.FXPreferredViewStyle = "clmv";
            loginwindow.LoginwindowText = "Erik's M1";
            screencapture.location = "~/Pictures/screenshots";
            screensaver.askForPasswordDelay = 0;
          };

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Enable alternative shell support in nix-darwin.
          # programs.fish.enable = true;
          programs.zsh.enable = true;

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 5;

          # The platform the configuration will be used on.
          # nixpkgs.hostPlatform = "aarch64-darwin";
          nixpkgs.hostPlatform = "x86_64-linux";
        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#Eriks-MacBook-Air
      nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
        modules = [ configuration ];
      };

      darwinConfigurations."Eriks-MacBook-Air" = nix-darwin.lib.darwinSystem {
        modules = [ configuration ];
      };

      # darwinConfigurations."apollo" = nix-darwin.lib.darwinSystem {
      #   modules = [ configuration ];
      # };
    };
}
