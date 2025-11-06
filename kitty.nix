{ ... }: {
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = "1.0";
      window_padding_width = "15";
      window_border_width = "0";
      draw_minimal_borders = "yes";

      font_family = "KosefontJP Nerd Font";
      font_size = "12.0";

      term = "xterm-256color";

      foreground = "#C5C8C9";
      background = "#0B0F10";

      color0  = "#3D3838";
      color1  = "#D4515B";
      color2  = "#FFE8AF";
      color3  = "#E8C5AC";
      color4  = "#618592";
      color5  = "#FFA1A8";
      color6  = "#99B9D8";
      color7  = "#E1DECF";

      color8  = "#4D4747";
      color9  = "#FA7781";
      color10 = "#FFF0CB";
      color11 = "#EFDCCC";
      color12 = "#8EA6B9";
      color13 = "#FDCBC5";
      color14 = "#C5E1FC";
      color15 = "#FFFCEE";
    };
  };
}
