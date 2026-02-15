{
  enable = true;
  settings = {
    main-bar = {
      battery = {
        format = "🔋{capacity}%";
        format-charging = "⚡{capacity}%";
        format-plugged = "🔌{capacity}%";
        states = {
          good = 90;
          warning = 30;
          critical = 15;
        };
      };
      clock = {
        format = "{:%Y-%m-%d %H:%M}";
      };
      cpu = {
        format = "CPU: {usage}%";
      };
      disk = {
        path = "/";
        format = "Disk: {free}";
      };
      height = 32;
      memory = {
        format = "Mem: {percentage}%";
      };
      modules-left = [
        "sway/workspaces"
        "sway/mode"
      ];
      modules-right = [
        "network"
        "cpu"
        "memory"
        "disk"
        "battery"
        "clock"
      ];
      network = {
        format-wifi = "WiFi: {essid} ({signalStrength}%)";
      };
    };
  };
  style = builtins.readFile ./style.css;
}
