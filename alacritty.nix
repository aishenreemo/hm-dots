{ ... }: {
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    window = {
      opacity = 1.0;
      padding.x = 20;
      padding.y = 20;
      decorations = "Full";
      decorations_theme_variant = "Dark";
      class = {
        general = "Alacritty";
        instance = "Terminal";
      };
    };

    font = {
      normal.family = "KosefontJP Nerd Font";
      bold.family = "KosefontJP Nerd Font";
      italic.family = "KosefontJP Nerd Font";
      bold_italic.family = "KosefontJP Nerd Font";
      glyph_offset.x = 0;
      glyph_offset.y = 0;
      offset.x = 0;
      offset.y = 0;
      size = 12.0;
    };

    colors.bright = {
      black = "#4D4747";
      red = "#FA7781";
      green = "#FFF0CB";
      yellow = "#EFDCCC";
      blue = "#8EA6B9";
      magenta  = "#FDCBC5";
      cyan = "#C5E1FC";
      white = "#FFFCEE";
    };

    colors.normal = {
      black = "#3D3838";
      red = "#D4515B";
      green= "#FFE8AF";
      yellow = "#E8C5AC";
      blue = "#618592";
      magenta  = "#FFA1A8";
      cyan = "#99B9D8";
      white = "#E1DECF";
    };

    colors.primary = {
      background = "#0B0F10";
      foreground = "#C5C8C9";
    };

    env = {
      "TERM" = "xterm-256color";
    };
  };
}
