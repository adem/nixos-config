let
  folder = name: {
    withDevices = devices: {
      id = name;
      path = "~/sync/${name}";
      inherit devices;
    };
  };
in
{
  claude = folder "claude";
  gb = folder "gb";
  gba = folder "gba";
  gbc = folder "gbc";
  mp = folder "mp";
  music-partial = folder "music-partial";
  music-transcoded = folder "music-transcoded";
  notes = folder "notes";
  password-db = folder "password-db";
  roehre = folder "roehre";
  rpc = folder "rpc";
  snes = folder "snes";
}
