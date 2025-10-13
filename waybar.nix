{ ... }: {
  programs.waybar.enable = true;
  programs.waybar.settings.main = {
    "modules-left" = ["custom/menu" "user" "clock" "hyprland/workspaces"];
    "modules-right" = ["hyprland/window" "tray"];
    "modules-center" = ["network" "bluetooth" "pulseaudio" "cpu" "memory" "disk"];
    "custom/menu" = {
      "format" = "󰋜";
      "on-click" = "pgrep -x 'wofi' > /dev/null || wofi --show drun --allow-images --no-actions";
      "tooltip-format" = "Open App-menu";
    };

    "user" = {
      "format" = " {user}";
      "interval" = 3600;
      "icon" = true;
      "open-on-click" = false;
    };

    "memory" = {
      "interval" = 30;
      "format" = " {}%";
      "max-length" = 10;
    };

    "network" = {
      "interface" = "*0*";
      "format" = "{ifname}";
      "format-wifi" = "  {essid} ({signalStrength}%)";
      "format-ethernet" = "󰈁 {ipaddr}/{cidr}";
      "format-disconnected" = "󱚼 No Internet";
      "tooltip-format" = "{ifname} via {gwaddr} 󰈁";
      "tooltip-format-wifi" = "{essid} ({signalStrength}%) ";
      "tooltip-format-ethernet" = "{ifname} 󰈁";
      "tooltip-format-disconnected" = "Disconnected";
    };

    "pulseaudio" = {
      "format" = "{icon} {volume}%";
      "format-bluetooth" = "{icon} {volume}% ";
      "format-muted" = " muted";
      "format-icons" = {
        "alsa_output.pci-0000_00_1f.3.analog-stereo" = "";
        "alsa_output.pci-0000_00_1f.3.analog-stereo-muted" = "";
        "headphone" = "";
        "hands-free" = "";
        "headset" = "";
        "phone" = "";
        "phone-muted" = "";
        "portable" = "";
        "car" = "";
        "default" = ["" ""];
      };
      "scroll-step" = 1;
      "on-click" = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
      "on-click-right" = "pavucontrol";
      "ignored-sinks" = ["Easy Effects Sink"];
    };

    "clock" = {
      "format" = " {:%H:%M}";
      "format-alt" = "󰃭 {:%A, %B %d, %Y (%R)} ";
      "tooltip-format" = "<tt><small>{calendar}</small></tt>";
      "calendar" = {
        "mode" = "year";
        "mode-mon-col" = 3;
        "weeks-pos" = "right";
        "on-scroll" = 1;
        "format" = {
          "months" = "<span color='#FFFCEE'><b>{}</b></span>";
          "days" = "<span color='#FDCBC5'><b>{}</b></span>";
          "weeks" = "<span color='#C5E1FC'><b>W{}</b></span>";
          "weekdays" = "<span color='#EFDCCC'><b>{}</b></span>";
          "today" = "<span color='#FA7781'><b><u>{}</u></b></span>";
        };
      };
      "actions" =  {
        "on-click-right" = "mode";
        "on-scroll-up" = "tz_up";
        "on-scroll-down" = "tz_down";
      };
    };

    "hyprland/workspaces" = {
      "format" = "{icon}";
      "persistent-workspaces" = {
        "1" = [];
        "2" = [];
        "3" = [];
        "4" = [];
        "5" = [];
        "6" = [];
        "7" = [];
        "8" = [];
        "9" = [];
        "10" = [];
      };
    };

    "hyprland/window" = {
      "separate-outputs" = true;
    };

    "tray" = {
      "icon-size" = 20;
      "spacing" = 10;
    };

    "cpu" = {
      "interval" = 2;
      "format" = " {usage}%";
      "max-length" = 10;
      "tooltip" = true;
    };

    "disk" = {
      "interval" = 30;
      "format" = "  {percentage_used}%";
      "path" = "/";
    };

    "bluetooth" = {
      "format" = " {status}";
      "format-connected" = " {device_alias}";
      "format-connected-battery" = " {device_alias} {device_battery_percentage}%";
      "tooltip-format" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
      "tooltip-format-connected" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
      "tooltip-format-enumerate-connected" = "{device_alias}\t{device_address}";
      "tooltip-format-enumerate-connected-battery" = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
      "on-click" = "alacritty -e bluetoothctl";
      "on-click-right" = "rfkill toggle bluetooth";
    };
  };
  programs.waybar.style = ''
    * {
      border: none;
      border-radius: 0;
      font-family: "KosefontJP Nerd Font", sans-serif;
      font-size: 13px;
      min-height: 1.5rem;
      padding: 0.01rem;
    }

    window#waybar {
      background: #0B0F10;
      color: #C5C8C9;
    }

    #workspaces button {
      padding: 0 5px;
      background: transparent;
      color: #C5C8C9;
    }

    button:hover {
      box-shadow: inset 0 -1px #C5C8C9;
    }

    #workspaces button.active {
      background: #C5C8C9;
      color: #0B0F10;
    }

    #window {
      padding-right: 1rem;
      color: #C5C8C9;
    }

    label.module {
      padding: 0 10px;
    }

    label.module:hover {
      box-shadow: inset 0 -1px #FFFFFF;
    }

    tooltip {
      background: #0B0F10;
      border: 1px solid #C5C8C9;
    }

    tooltip label {
      color: #C5C8C9;
    }

    #disk {
      color: #FFE8AF;
    }

    #memory {
      color: #96D6B0;
    }

    #cpu {
      color: #C5E1FC;
    }

    #bluetooth {
      color: #8EA6B9;
    }

    #network {
      color: #87C7A1;
    }

    #pulseaudio {
      color: #DE8F78;
    }

    #user {
      color: #99B9D8;
    }

    #clock {
      color: #FDCBC5;
    }

    #custom-menu {
      color: #E8C5AC;
    }
  '';
}
