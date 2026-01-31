{ pkgs, voxtype-pkg, ... }:
{
  boot.loader.systemd-boot.enable = true;

  environment = {
    systemPackages = with pkgs; [
      chromium
      fzf
      git-crypt
      gitui
      gnupg
      grim
      htop
      imv
      jellyfin-desktop
      libnotify
      mpv
      nil
      nixfmt
      nnn
      obs-studio
      rofi
      slurp
      sshfs
      sublime-merge
      usbutils
      voxtype-pkg
      wget
      wl-clipboard
      yt-dlp
    ];
    interactiveShellInit = ''
      export GPG_TTY="$(tty)"
    '';
    variables = {
      EDITOR = "hx";
    };
  };

  fonts = {
    packages = [
      (pkgs.runCommand "pragmatapro" { } ''
        mkdir -p $out/share/fonts/opentype
        cp ${../fonts/PragmataPro0.903}/*.otf $out/share/fonts/opentype/
      '')
    ];
    fontconfig.defaultFonts.monospace = [ "PragmataPro Mono Liga" ];
  };

  home-manager = {
    useGlobalPkgs = true;
    backupFileExtension = "backup";
  };

  networking = {
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];
    wireless.iwd = {
      enable = true;
      settings.General.EnableNetworkConfiguration = true;
    };
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs = {
    fish.enable = true;
    gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-all;
    };
  };

  security.sudo.wheelNeedsPassword = false;

  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    tailscale.enable = true;
  };

  time.timeZone = "Europe/Berlin";

  virtualisation.docker.enable = true;
}
