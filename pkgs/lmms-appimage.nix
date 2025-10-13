{ lib, appimageTools, fetchurl }:

let
  pname = "lmms";
  version = "1.2.2";

  src = fetchurl {
    url = "https://github.com/LMMS/lmms/releases/download/v${version}/lmms-${version}-linux-x86_64.AppImage";
    sha256 = "0xlvhrc45jyh8vb27nnpzzcg7rnc7z0cm6y4jm9di34vd6h4bp3c";
  };

  # Extract the AppImage contents (Type 1 format)
  appimageContents = appimageTools.extractType1 {
    inherit pname version src;
  };

in
appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    mkdir -p $out/share/applications $out/share/icons/hicolor/256x256/apps

    # Copy desktop file and icon manually
    cp ${appimageContents}/lmms.desktop $out/share/applications/
    cp ${appimageContents}/lmms.png $out/share/icons/hicolor/256x256/apps/lmms.png

    # Fix Exec path to point to actual binary
    sed -i "s|^Exec=.*|Exec=${pname}|" $out/share/applications/lmms.desktop
  '';

  meta = with lib; {
    description = "Linux MultiMedia Studio — free cross-platform music production software";
    homepage = "https://lmms.io/";
    license = licenses.gpl2Plus;
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
    maintainers = [];
    platforms = [ "x86_64-linux" ];
    mainProgram = pname;
  };
}
