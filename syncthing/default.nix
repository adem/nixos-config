{ ... }:

{
  services.syncthing = {
    enable = true;
    user = "adem";
    dataDir = "/home/adem/sync";
    configDir = "/home/adem/.config/syncthing";
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices = {
        "OnePlus 7 Pro" = { id = "4L5GTZX-BD2EH75-NVJ3SWD-QPZ343U-Q5PFJ3X-NRZUO34-HBVAE5R-232XHQY"; };
      	"seawa" = { id = "EVSNYCF-65IHUO4-ZSFDHXD-IOLTZK2-52BBRIO-QFMT5FL-EGURAO4-DZ7UMQH"; };
      };
      folders = {
        "files" = {
      	  id = "files";
          path = "/home/adem/sync/files";
          devices = [ "OnePlus 7 Pro" ];
        };
        "7 WS23" = {
      	  id = "uzkik-rpbmp";
          path = "/home/adem/sync/7 WS23";
          devices = [ "OnePlus 7 Pro" ];
        };
        "Camera" = {
      	  id = "oneplus_7_pro_tn7q-photos";
          path = "/home/adem/sync/Camera";
          devices = [ "OnePlus 7 Pro" ];
        };
        "Missing Semester" = {
      	  id = "yxhjo-tgrwa";
          path = "/home/adem/sync/Missing Semester";
          devices = [ "OnePlus 7 Pro" ];
        };
        "Optimierung" = {
      	  id = "zfj9d-ejkre";
          path = "/home/adem/sync/Optimierung";
          devices = [ "OnePlus 7 Pro" ];
        };
        "roehre" = {
      	  id = "7o5fj-ecveu";
          path = "/home/adem/sync/roehre";
          devices = [ "seawa" ];
        };
      };
    };
  };
}
