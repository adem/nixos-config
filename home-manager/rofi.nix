{ pkgs, ... }:
{
  enable = true;
  package = pkgs.rofi;
  plugins = [ pkgs.rofi-calc ];
  extraConfig = {
    modi = "calc,combi,drun,run,window";
    combi-modi = "run,window";
  };
}
