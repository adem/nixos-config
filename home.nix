{ config, pkgs, ...}:

{
  home.username = "adem";
  home.homeDirectory = "/home/adem";

  home.packages = with pkgs; [
    firefox
    gnumake
    helix
    iosevka
    keepassxc
    llvm_16
    mpv
    nnn
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodejs
    pavucontrol
    python3
    signal-desktop
    subversion
    sqlite
    unzip
    unrar
    weechat
  ];

  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.gnome.adwaita-icon-theme;
    size = 24;
  };

  home.stateVersion = "23.05";

  programs.git = {
    enable = true;
    signing = {
      key = "5C0125ED93A6C45E";
      signByDefault = true;
    };
    userName = "Adem Aydin";
    userEmail = "mail@adem.dev";
  };

  programs.home-manager.enable = true;

  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      placement_strategy = "top-left";
    };
  };

  programs.zathura.enable = true;

  wayland.windowManager.sway = {
    enable = true;
    config = {
      input."type:pointer".pointer_accel = "-1";
      input."type:keyboard" = {
        repeat_delay = "200";
        repeat_rate = "20";
      };
      modifier = "Mod1";
      output.HDMI-A-1 = {
          res = "3840x2160@120Hz";
          scale = "2";
      };
      terminal = "kitty";
    };
    extraSessionCommands = ''
      # Set dark theme.
      export GTK_THEME=Adwaita:dark
      export QT_STYLE_OVERRIDE=adwaita-dark
    '';
  };
}
