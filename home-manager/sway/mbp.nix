{
  imports = [ ./base.nix ];
  wayland.windowManager.sway.config.output = {
    "eDP-1" = {
      pos = "0 0";
      res = "3024x1890@120Hz";
    };
    "HDMI-A-1" = {
      pos = "1512 0";
      res = "2560x1440@120Hz";
    };
  };
}
