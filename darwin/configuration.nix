{
  # self,
  pkgs,
  ...
}:
{
          nix.settings.experimental-features = "nix-command flakes";

          environment.systemPackages = with pkgs; [
		curl
          ];

          security.pam.enableSudoTouchIdAuth = true;

          system.keyboard.enableKeyMapping = true;
          system.keyboard.remapCapsLockToEscape = true;

          system.defaults = {
            dock.autohide = true;
            dock.mru-spaces = false;
            finder.AppleShowAllExtensions = true;
            finder.FXPreferredViewStyle = "clmv";
            loginwindow.LoginwindowText = "Erik's M1";
            screencapture.location = "~/Pictures/screenshots";
            screensaver.askForPasswordDelay = 0;
          };

          programs.zsh.enable = true;

          # system.configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 5;

          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "aarch64-darwin";
}
 
