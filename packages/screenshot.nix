{
  writeShellApplication,
  slurp,
  grim,
  wl-clipboard,
  libnotify,
}:
writeShellApplication {
  name = "screenshot";
  runtimeInputs = [
    slurp
    grim
    wl-clipboard
    libnotify
  ];
  text = ''
    mkdir -p ~/sync/screenshots
    FILE=~/sync/screenshots/$(date +%Y%m%d_%H%M%S).png
    grim -g "$(slurp)" "$FILE" && wl-copy < "$FILE" && notify-send -t 3000 "Screenshot saved"
  '';
}
