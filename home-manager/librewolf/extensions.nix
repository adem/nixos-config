{ pkgs }:
let
  addons = pkgs.nur.repos.rycee.firefox-addons;
in
{
  base = [
    addons.browserpass
    addons.keepassxc-browser
    addons.sponsorblock
    addons.vimium-c
    addons.violentmonkey
  ];
  torrent-control = addons.torrent-control;
}
