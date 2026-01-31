{ pkgs, ... }:
let
  rofi-window-switcher = pkgs.callPackage ../../packages/rofi-window-switcher.nix { };
  screenshot = pkgs.callPackage ../../packages/screenshot.nix { };
  screencast = pkgs.callPackage ../../packages/screencast.nix { wfrecorder = pkgs.wf-recorder; };
in
{
  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod4";
      terminal = "ghostty";
      keybindings =
        let
          modifier = "Mod4";
        in
        pkgs.lib.mkOptionDefault {
          "${modifier}+d" = "exec rofi -show drun";
          "${modifier}+Tab" = "exec ${rofi-window-switcher}/bin/rofi-window-switcher";
          "XF86MonBrightnessUp" = "exec brightnessctl -e set 5%+";
          "XF86MonBrightnessDown" = "exec brightnessctl -e set 5%-";
          "XF86KbdBrightnessUp" = "exec brightnessctl -d '*kbd*' -e set 5%+";
          "XF86KbdBrightnessDown" = "exec brightnessctl -d '*kbd*' -e set 5%-";
          "XF86AudioRaiseVolume" = "exec wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+";
          "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
          "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "XF86AudioMicMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          "${modifier}+Shift+s" = "sticky toggle";
          "${modifier}+Shift+semicolon" = "exec ${screenshot}/bin/screenshot";
          "${modifier}+Shift+apostrophe" = "exec ${screencast}/bin/screencast";
          "--no-repeat ${modifier}+Shift+v" = "exec voxtype record start";
          "--release ${modifier}+Shift+v" = "exec voxtype record stop";
        };
      input = {
        "type:keyboard" = {
          xkb_options = "caps:escape,grp:ctrl_space_toggle";
          xkb_layout = "us,de";
          repeat_delay = "150";
          repeat_rate = "60";
        };
        "type:pointer" = {
          accel_profile = "flat";
        };
      };
      startup = [
        { command = "brightnessctl -d '*kbd*' set 1%"; }
      ];
    };
  };
  xdg.configFile."voxtype/config.toml".source = ../../dotfiles/voxtype.toml;
}
