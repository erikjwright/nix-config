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
    imagemagick
    jq
    lazygit
    loupe
    neovim-nightly-overlay.packages.${system}.default
    overskride
    podman
    podman-tui
    poppler
    rclone
    ripgrep
    sops
    starship
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

  # environment.sessionVariables = rec {
  #   XDG_CACHE_HOME  = "$HOME/.cache";
  #   XDG_CONFIG_HOME = "$HOME/.config";
  #   XDG_DATA_HOME   = "$HOME/.local/share";
  #   XDG_STATE_HOME  = "$HOME/.local/state";
  #
  #   # Not officially in the specification
  #   XDG_BIN_HOME    = "$HOME/.local/bin";
  #
  #   PATH = [
  #     "${XDG_BIN_HOME}"
  #   ];
  # };

  # services.gpg-agent = {
  #   enable = true;
  #   defaultCacheTtl = 1800;
  #   enableSshSupport = true;
  # };
}
