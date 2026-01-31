{ email, sway }:
{ pkgs, ... }:
{
  imports = [
    ../helix.nix
    ../sway/${sway}.nix
  ];

  home.stateVersion = "25.11";

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    fish = import ../fish.nix { inherit pkgs; };
    git = import ../git.nix { inherit email; };
    ghostty = import ../ghostty.nix;
    keepassxc = import ../keepassxc.nix;
    zellij.enable = true;
  };

  xdg.configFile."zellij/config.kdl".source = ../../dotfiles/zellij.kdl;
}
