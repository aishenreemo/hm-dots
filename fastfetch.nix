{ config, pkgs, ... }: {
  programs.fastfetch.enable = true;
  programs.fastfetch.package = pkgs.fastfetch.overrideAttrs (old: {
    buildInputs = old.buildInputs ++ [ pkgs.imagemagick ];
    cmakeFlags = old.cmakeFlags or [] ++ [
      "-DENABLE_IMAGEMAGICK7=ON"
      "-DENABLE_IMAGEMAGICK6=ON"
    ];
  });

  programs.fastfetch.settings = {
    logo = {
      type = "kitty-icat";
      source = "${config.home.homeDirectory}/.config/home-manager/imgs/teto-banner.png";
      width = 40;
      height = 20;
    };

    modules = [
      "title"
      "separator"
      "os"
      "host"
      "kernel"
      "uptime"
      "packages"
      "shell"
      "display"
      "de"
      "wm"
      "wmtheme"
      "theme"
      "icons"
      "font"
      "cursor"
      "terminal"
      "terminalfont"
      "cpu"
      "gpu"
      "memory"
      "swap"
      "disk"
      "localip"
      "battery"
      "poweradapter"
      "locale"
      "break"
      "colors"
    ];
  };
}
