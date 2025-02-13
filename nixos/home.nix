{
  pkgs,
  neovim-nightly-overlay,
  zen-browser,
  ...
}: {
  home.username = "erik";
  home.homeDirectory = "/home/erik";

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    btop
    # cameractrls
    chezmoi
     # dbeaver-bin
    direnv
    eza
    fd
    fzf
    ghostty
    # killall
    lazygit
    neovim-nightly-overlay.packages.${system}.default
    nixfmt-rfc-style
    overskride
    podman
    podman-tui
    ripgrep
    starship
    # ungoogled-chromium
    unzip
    waybar
    wofi
    yazi
    zen-browser.packages."${system}".default
    zoxide
  ];

  programs.home-manager.enable = true;
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
