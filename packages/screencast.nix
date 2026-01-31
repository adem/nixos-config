{
  writeShellApplication,
  slurp,
  wfrecorder,
  libnotify,
}:
writeShellApplication {
  name = "screencast";
  runtimeInputs = [
    slurp
    wfrecorder
    libnotify
  ];
  text = ''
    if pkill -INT wf-recorder; then
      exit 0
    fi
    mkdir -p ~/sync/screencasts
    GEOMETRY=$(slurp)
    NOTIFICATION_ID=$(notify-send -t 0 -p "Recording" "Screencast in progress")
    wf-recorder -a -g "$GEOMETRY" -f ~/sync/screencasts/"$(date +%Y%m%d_%H%M%S).mp4"
    notify-send -r "$NOTIFICATION_ID" -t 3000 "Recording saved"
  '';
}
