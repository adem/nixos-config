{ email, sway, voxtype-model }:
{ pkgs, voxtype-pkg, ... }:
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
    voxtype = import ../voxtype.nix { inherit voxtype-pkg; model = voxtype-model; };
    zellij.enable = true;
  };

  # Workaround: voxtype needs `which` on PATH for output driver detection.
  systemd.user.services.voxtype.Service.Environment = [
    "PATH=/run/current-system/sw/bin"
  ];

  xdg.configFile = {
    "zellij/config.kdl".source = ../../dotfiles/zellij.kdl;
    "zellij/plugins/room.wasm".source = pkgs.fetchurl {
      url = "https://github.com/rvcas/room/releases/download/v1.2.1/room.wasm";
      hash = "sha256-kLSDpAt2JGj7dYYhYFh6BfvtzVwTrcs+0jHwG/nActE=";
    };
  };
}
