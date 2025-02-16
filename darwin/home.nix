{ pkgs, neovim-nightly-overlay, ... }:
{
	home.username = "erik";
	home.homeDirectory = "/Users/erik";

	home.stateVersion = "24.11";

	# xdg.enable = true;

	home.packages = with pkgs; [
		appflowy
		chezmoi
		dbeaver-bin
		direnv
		eza
		fzf
		git
		# ghostty
		lazygit
		neovim-nightly-overlay.packages.${system}.default
		nixfmt-rfc-style
		ripgrep
		starship
		thunderbird-latest-unwrapped
		yazi
		zoxide
	];

	programs = {
		home-manager.enable = true;
		direnv = {
			enable = true;
			enableZshIntegration = true;
			nix-direnv.enable = true;
		};
	}
		# programs.direnv.enable = true;
		# programs.htop.enable = true;
		# programs.htop.settings.show_program_path = true;

}
