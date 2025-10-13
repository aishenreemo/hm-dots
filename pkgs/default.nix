{ pkgs }: {
  mako-sound = pkgs.callPackage ./mako-sound.nix { };
  kosefont = pkgs.callPackage ./kosefont.nix { };
  lmms-appimage = pkgs.callPackage ./lmms-appimage.nix { };
}
