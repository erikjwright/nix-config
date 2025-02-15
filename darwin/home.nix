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
    neovim-nightly-overlay.packages.${system}.default
    nixfmt-rfc-style
    starship
    yazi
    zoxide
  ];

  programs.home-manager.enable = true;
  # programs.direnv.enable = true;
  # programs.htop.enable = true;
  # programs.htop.settings.show_program_path = true;

}
