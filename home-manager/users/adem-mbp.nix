{ pkgs, ... }:
let
  syncthing = import ../syncthing;
  librewolf = import ../librewolf { inherit pkgs; };
  base = import ./base.nix {
    email = "mail@adem.dev";
    sway = "mbp";
  };
in
{
  imports = [ base ];

  home.packages = [
    (pkgs.wrapRetroArch {
      cores = with pkgs.libretro; [
        mgba
        gambatte
        bsnes
      ];
      settings = {
        video_shader_dir = "${pkgs.libretro-shaders-slang}/share/libretro/shaders";
      };
    })
    pkgs.retroarch-assets
  ];

  programs.librewolf = {
    enable = true;
    profiles = {
      default = librewolf.profiles.default.withExtraExtensions [ ];
      a = librewolf.profiles.a.withExtraExtensions [ librewolf.extensions.torrent-control ];
    };
  };

  services.syncthing = {
    enable = true;
    settings = {
      devices = {
        inherit (syncthing.devices) nas phone rpc;
      };
      folders = with syncthing.folders; {
        password-db = password-db.withDevices [ "phone" ];
        gb = gb.withDevices [ "nas" ];
        gba = gba.withDevices [ "nas" ];
        gbc = gbc.withDevices [ "nas" ];
        music-partial = music-partial.withDevices [ "nas" ];
        notes = notes.withDevices [ "phone" ];
        roehre = roehre.withDevices [
          "nas"
          "phone"
        ];
        rpc = rpc.withDevices [ "rpc" ];
        snes = snes.withDevices [ "nas" ];
      };
      options.urAccepted = -1;
    };
  };
}
