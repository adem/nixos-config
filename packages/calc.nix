{
  writeShellApplication,
  libqalculate,
  libnotify,
}:
writeShellApplication {
  name = "calc";
  runtimeInputs = [
    libqalculate
    libnotify
  ];
  text = ''
    expr=$(cat)
    result=$(qalc -t "$expr")
    notify-send -t 5000 "calc" "$expr = $result"
  '';
}
