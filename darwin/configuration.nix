{
  # self,
  pkgs,
  ...
}:
{
  # users.defaultUserShell=pkgs.zsh;
  users.users.erik.shell = pkgs.zsh;
  # system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  nix.settings.experimental-features = "nix-command flakes";
  nix.enable = false;

  environment.systemPackages = with pkgs; [
    curl
  ];

  security.pam.enableSudoTouchIdAuth = true;

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;

  fonts.packages = with pkgs; [
    # nerd-fonts.fira-code
    # nerd-fonts.meslo-lg
    nerd-fonts.monaspace
    nerd-fonts.caskaydia-cove
    nerd-fonts.caskaydia-mono
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
      "bitwarden"
      "chromium"
      "docker"
      "ghostty"
      "keybase"
      "mullvadvpn"
      "neohtop"
      "notion"
      "raycast"
      "zen-browser"
    ];
    masApps = {
      slack = 803453959;
    };
  };

  programs.zsh.enable = true;

}
