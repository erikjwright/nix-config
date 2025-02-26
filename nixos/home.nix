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
        age
    # bitwarden-cli
    bitwarden-desktop
    # cameractrls
    chezmoi
        clang
    cloudflared
    cryptomator
        cryptsetup
    czkawka
    # dbeaver-bin
    direnv
    eza
    fd
    ffmpeg
    fzf
    ghostty
        gparted
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
        rpi-imager
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
        yq
    zen-browser.packages."${system}".default
    zoxide
  ];

  #   wayland.windowManager.hyprland = {
  # enable = true;
  # # set the Hyprland and XDPH packages to null to use the ones from the NixOS module
  # package = null;
  # portalPackage = null;
# };

  programs.home-manager.enable = true;
  programs.direnv.enable = true;
  programs.htop.enable = true;
  # programs.zsh.enable = true;

  # programs.firefox.enable = true;

}
