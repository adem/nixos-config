{
  imports = [ ./base.nix ];
  wayland.windowManager.sway.config.output."HDMI-A-1" = {
    pos = "0 0";
    res = "3840x2160@120Hz";
    scale = "2";
  };
}
