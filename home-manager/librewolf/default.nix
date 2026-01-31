{ pkgs }:
let
  extensions = import ./extensions.nix { inherit pkgs; };
  settings = import ./settings.nix;
in
{
  inherit extensions;
  profiles = import ./profiles.nix { inherit extensions settings; };
}
