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
  password-db = folder "password-db";
  gb = folder "gb";
  gba = folder "gba";
  gbc = folder "gbc";
  music-partial = folder "music-partial";
  music-transcoded = folder "music-transcoded";
  notes = folder "notes";
  rpc = folder "rpc";
  snes = folder "snes";
}
