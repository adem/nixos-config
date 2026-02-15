{
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ../base.nix
    ./hardware-configuration.nix
  ];

  boot.kernelParams = [ "appledrm.show_notch=1" ];

  boot.loader.efi.canTouchEfiVariables = false;

  environment.systemPackages = with pkgs; [
    acpi
    brightnessctl
    openvpn
    pavucontrol
  ];

  hardware.asahi.peripheralFirmwareDirectory = ./firmware;
  hardware.bluetooth.enable = true;

  home-manager.users = {
    adem = import ../../home-manager/users/adem-mbp.nix;
    ademaydin = import ../../home-manager/users/ademaydin-mbp.nix;
  };

  networking.hostName = "nixos-mbp";

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "sublime-merge"
    ];

  programs = {
    git.enable = true;
    sway.enable = true;
  };

  swapDevices = [
    {
      device = "/swapfile";
      size = 16384;
    }
  ];

  system.stateVersion = "25.11";

  users.users.adem = {
    isNormalUser = true;
    extraGroups = [
      "docker"
      "wheel"
    ];
    shell = pkgs.fish;
  };
  users.users.ademaydin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };
}
