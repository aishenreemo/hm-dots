{
  pkgs,
  nixgl,
  custom-pkgs,
  nixvim-dots,
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
    alacritty
    wofi
    mako
    libnotify
    wl-clipboard
    grim
    slurp
    pass-wayland
    fastfetch
    custom-pkgs.kosefont
    custom-pkgs.lmms-appimage
    custom-pkgs.mako-sound
    nixvim-dots.packages."x86_64-linux".default
    fontconfig
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];

  fonts.fontconfig.enable = true;
  home.file.".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ";
  home.file.".config/user-dirs.dirs".text = ''
    XDG_DOWNLOAD_DIR="$HOME/downloads"
    XDG_DOCUMENT_DIR="$HOME/documents"
  '';

  programs.home-manager.enable = true;
}
