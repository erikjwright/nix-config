{
  pkgs,
  neovim-nightly-overlay,
  zen-browser,
  ...
}:
{
  home.username = "erik";
  home.homeDirectory = "/home/erik";

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    # bitwarden-cli
    bitwarden-desktop
    # cameractrls
    chezmoi
    cloudflared
    cryptomator
    czkawka
    # dbeaver-bin
    direnv
    eza
    fd
    ffmpeg
    fzf
    ghostty
    gnupg
        hyprpolkitagent
    imagemagick
    jq
    lazygit
    loupe
        # mullvad-browser
    neovim-nightly-overlay.packages.${system}.default
    overskride
    podman
    podman-tui
    poppler
    rclone
    ripgrep
    sops
    starship
        swaynotificationcenter
    thunderbird
    ungoogled-chromium
    unzip
    vaultwarden
    waybar
    wofi
    yazi
    zen-browser.packages."${system}".default
    zoxide
  ];

  programs.home-manager.enable = true;
  programs.direnv.enable = true;
  programs.htop.enable = true;
  # programs.zsh.enable = true;

  # programs.firefox.enable = true;

}
