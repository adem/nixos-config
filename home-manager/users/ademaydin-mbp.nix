{ pkgs, ... }:
let
  syncthing = import ../syncthing;
  librewolf = import ../librewolf { inherit pkgs; };
  base = import ./base.nix {
    email = "aydin@meqo.de";
    sway = "mbp";
  };
in
{
  imports = [
    base
  ];

  home.packages = [ pkgs.freerdp ];

  programs.librewolf = {
    enable = true;
    profiles = {
      default = librewolf.profiles.default.withExtraExtensions [ librewolf.extensions.torrent-control ];
      a = librewolf.profiles.a.withExtraExtensions [ librewolf.extensions.torrent-control ];
    };
  };

  services.syncthing = {
    enable = true;
    guiAddress = "127.0.0.1:8385";
    settings = {
      devices = {
        inherit (syncthing.devices) phone;
      };
      folders = with syncthing.folders; {
        password-db = password-db.withDevices [ "phone" ];
      };
      options.urAccepted = -1;
    };
  };
}
