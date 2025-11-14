{
  pkgs,
  nixgl,
  custom-pkgs,
  ...
}: {
  home.username = "aivan";
  home.homeDirectory = "/home/aivan";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    hyprland
    hyprpaper
    mesa
    wlroots
    nixgl
    waybar
    wofi
    mako
    libnotify
    wl-clipboard
    grim
    slurp
    pass-wayland
    imagemagick
    custom-pkgs.kosefont
    custom-pkgs.lmms-appimage
    custom-pkgs.mako-sound
    mpd
    mpc
    fontconfig
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    tmux-sessionizer
    zk
  ];

  fonts.fontconfig.enable = true;
  fonts.fontconfig.configFile = {
    "10-kosefont" = {
      enable = true;
      text = ''
        <?xml version="1.0"?>
        <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
        <fontconfig>
          <match target="scan">
            <test name="family">
              <string>KosefontJP Nerd Font</string>
            </test>
            <edit name="spacing" mode="assign">
              <int>100</int>
            </edit>
          </match>
        </fontconfig>
      '';
    };
  };

  home.file.".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ";
  home.file.".config/user-dirs.dirs".text = ''
    XDG_DOWNLOAD_DIR="$HOME/downloads"
    XDG_DOCUMENT_DIR="$HOME/documents"
  '';

  programs.home-manager.enable = true;
}
