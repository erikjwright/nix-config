{ pkgs, ... }: {
  home.username = "erik";
  home.homeDirectory = "/home/erik";
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    # your desired nixpkgs here
  ];
  home.stateVersion = "23.11";
};
