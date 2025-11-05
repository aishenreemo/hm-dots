{ ... }:

{
  programs.fish.enable = true;
  programs.fish.shellInit = ''
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias alacritty="nixGL alacritty"
    set -Ux EDITOR nvim
    set -gx GPG_TTY (tty)
    set -gx PATH /nix/var/nix/profiles/default/bin:$HOME/.local/bin:$HOME/.nix-profile/bin:/usr/bin
    set -gx XDG_CONFIG_HOME $HOME/.config
    set -x XDG_DATA_DIRS "$HOME/.local/share:$HOME/.nix-profile/share:$XDG_DATA_HOME/share:/usr/local/share:/usr/share:$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share"
    set fish_greeting
    if test (tty) = "/dev/tty1"
      if not set -q WAYLAND_DISPLAY
          exec nixGL hyprland
      end
    end

  '';
}
