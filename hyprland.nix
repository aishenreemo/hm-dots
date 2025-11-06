{ ... }: {
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    "$terminal" = "nixGL kitty";
    "$menu" = ''pgrep -x "wofi" > /dev/null || wofi --show drun --allow-images --no-actions'';
    "exec-once" = [
      "mako"
      "waybar"
    ];

    "env" = [
      "XCURSOR_SIZE,24"
      "HYPRCURSOR_SIZE,24"
    ];

    "general" = {
      "gaps_in" = 5;
      "gaps_out" = 5;
      "border_size" = 1;
      "col.active_border" = "rgba(C5E1FCEE) rgba(618592EE) 45deg";
      "col.inactive_border" = "rgba(3D3838AA)";
      "resize_on_border" = false;
      "allow_tearing" = false;
      "layout" = "dwindle";
    };

    "monitor" = ",preferred,auto,auto";

    "decoration" = {
      "rounding" = 10;
      "active_opacity" = 1.0;
      "inactive_opacity" = 1.0;
      "shadow" = {
        "enabled" = true;
        "range" = 4;
        "render_power" = 3;
        "color" = "rgba(1a1a1aee)";
      };

      "blur" = {
        "enabled" = true;
        "size" = 3;
        "passes" = 1;

        "vibrancy" = 0.1696;
      };
    };

# https://wiki.hyprland.org/Configuring/Variables/#animations
    "animations" = {
      "enabled" = true;
      "bezier" = [
        "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
      ];
      "animation" = [
        "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
      ];
    };

    "dwindle" = {
      "pseudotile" = true;
      "preserve_split" = true;
    };

    "master" = {
      "new_status" = "master";
    };

    "misc" = {
      "force_default_wallpaper" = -1;
      "disable_hyprland_logo" = true;
      "background_color" = "0x0B0F10";
    };

    "input" = {
      "kb_layout" = "us";
      "follow_mouse" = 0;
      "float_switch_override_focus" = 0;
      "sensitivity" = 0;
      "touchpad" = {
        "natural_scroll" = false;
      };
    };

    "device" = {
      "name" = "epic-mouse-v1";
      "sensitivity" = -0.5;
    };

    "$mod" = "SUPER";

    "bind" = [
      '', Print, exec, grim -g "$(slurp -d)" - | wl-copy -t image/png''
      "$mod, RETURN, exec, $terminal"
      "$mod, B, exec, nixGL firefox"
      "$mod, C, killactive,"
      "$mod SHIFT, Q, exit,"
      "$mod, SPACE, togglefloating,"
      "$mod, F, fullscreen"
      "$mod, A, exec, $menu"
      "$mod, P, pseudo,"
      "$mod, J, togglesplit,"
      "$mod, h, movefocus, l"
      "$mod, l, movefocus, r"
      "$mod, k, movefocus, u"
      "$mod, j, movefocus, d"
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 10"
      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
      "$mod SHIFT, 9, movetoworkspace, 9"
      "$mod SHIFT, 0, movetoworkspace, 10"
      "$mod, S, togglespecialworkspace, magic"
      "$mod SHIFT, S, movetoworkspace, special:magic"
      "$mod, mouse_down, workspace, e+1"
      "$mod, mouse_up, workspace, e-1"
    ];

    "bindm" = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
    "windowrulev2" = [
      "suppressevent maximize, class:.*"
      "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
    ];
  };
}
