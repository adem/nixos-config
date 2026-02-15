{ pkgs, ... }:
let
  syncthing = import ../syncthing;
  librewolf = import ../librewolf { inherit pkgs; };
  base = import ./base.nix {
    email = "mail@adem.dev";
    sway = "desktop";
  };
in
{
  imports = [
    base
  ];

  programs = {
    librewolf = {
      enable = true;
      profiles = {
        default = librewolf.profiles.default.withExtraExtensions [ librewolf.extensions.torrent-control ];
        a = librewolf.profiles.a.withExtraExtensions [ librewolf.extensions.torrent-control ];
      };
    };

    plasma = {
      enable = true;
      input.mice = [
        {
          name = "Logitech G Pro "; # Trailing space is not a typo.
          vendorId = "046d";
          productId = "4079";
          accelerationProfile = "none";
          acceleration = 0.0;
        }
      ];
      input.keyboard = {
        repeatDelay = 150;
        repeatRate = 60;
        layouts = [
          { layout = "us"; }
          { layout = "de"; }
        ];
        options = [
          "caps:escape"
          "grp:ctrl_space_toggle"
        ];
      };
    };
  };

  services = {
    syncthing = {
      enable = true;
      settings = {
        devices = {
          inherit (syncthing.devices) phone nas rpc;
        };
        folders = with syncthing.folders; {
          password-db = password-db.withDevices [ "phone" ];
          music-transcoded = music-transcoded.withDevices [ "nas" ];
          rpc = rpc.withDevices [ "rpc" ];
        };
        options.urAccepted = -1;
      };
    };
  };
}
