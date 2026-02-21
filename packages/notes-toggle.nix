{
  writeShellApplication,
  writeShellScript,
  sway,
  ghostty,
  zellij,
  helix,
  gnugrep,
}:
let
  hx-notes = writeShellScript "hx-notes" ''
    exec ${helix}/bin/hx "$HOME/sync/notes"
  '';
in
writeShellApplication {
  name = "notes-toggle";
  runtimeInputs = [
    sway
    ghostty
    zellij
    gnugrep
  ];
  text = ''
    if swaymsg -t get_tree | grep -q '"app_id": "com.ghostty.notes"'; then
      zellij -s notes action write 27 && zellij -s notes action write-chars ":wa" && zellij -s notes action write 13
      swaymsg '[app_id="com.ghostty.notes"] scratchpad show'
    else
      ghostty --class=com.ghostty.notes -e zellij attach notes --create options --default-shell ${hx-notes}
    fi
  '';
}
