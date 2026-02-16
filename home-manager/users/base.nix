{ email, sway }:
{ pkgs, ... }:
{
  imports = [
    ../helix.nix
    ../mako.nix
    ../sway/${sway}.nix
    ../zathura.nix
  ];

  home.stateVersion = "25.11";

  programs = {
    browserpass = {
      enable = true;
      browsers = [ "firefox" ];
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    fish = import ../fish.nix { inherit pkgs; };
    git = import ../git.nix { inherit email; };
    ghostty = import ../ghostty.nix;
    keepassxc = import ../keepassxc.nix;
    rofi = import ../rofi.nix { inherit pkgs; };
    password-store = {
      enable = true;
      package = pkgs.pass-wayland;
      settings = {
        PASSWORD_STORE_DIR = "~/.password-store";
      };
    };
    zellij.enable = true;
  };

  xdg.configFile = {
    "voxtype/config.toml".source = ../../dotfiles/voxtype.toml;
    "zellij/config.kdl".source = ../../dotfiles/zellij.kdl;
  };
}
