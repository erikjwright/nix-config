{ config, pkgs, lib, neovim-nightly-overlay, ... }:
{
  home.stateVersion = "24.11";

  # xdg.enable = true;

  home.packages = with pkgs; [
            chezmoi
            dbeaver-bin
            direnv
            eza
            fzf
            git
            neovim-nightly-overlay.packages.${system}.default
            nixfmt-rfc-style
            starship
	    yazi
            zoxide
  ];

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
	      "docker"
              "ghostty"
              "keybase"
              "mullvadvpn"
              "notion"
              "raycast"
              "zen-browser"
            ];
            masApps = {
              slack = 803453959;
            };
          };

  programs.home-manager.enable = true;
  programs.direnv.enable = true;
  programs.htop.enable = true;
  # programs.htop.settings.show_program_path = true;


}
