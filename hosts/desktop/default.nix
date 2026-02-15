{ pkgs, ... }:
{
  imports = [
    ../base.nix
    ./hardware-configuration.nix
  ];

  boot.loader.efi.canTouchEfiVariables = true;

  environment.systemPackages = with pkgs; [
    teamspeak3
    vesktop
  ];

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          ControllerMode = "bredr";
          Experimental = true;
          FastConnectable = true;
        };
        Policy = {
          AutoEnable = true;
        };
      };
    };

    graphics = {
      enable = true;
      enable32Bit = true;
    };

    steam-hardware.enable = true;
  };

  home-manager.users.adem = import ../../home-manager/users/adem-desktop.nix;

  i18n.defaultLocale = "en_US.UTF-8";

  networking.hostName = "nixos-tower";

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "qtwebengine-5.15.19"
    ];
  };

  programs = {
    gamemode.enable = true;
    gamescope.enable = true;

    steam = {
      enable = true;
      extraCompatPackages = [ pkgs.proton-ge-bin ];
    };
  };

  services.desktopManager.plasma6.enable = true;

  system.stateVersion = "25.11";

  users.users.adem = {
    extraGroups = [
      "docker"
      "wheel"
    ];
    isNormalUser = true;
    shell = pkgs.fish;
  };
}
