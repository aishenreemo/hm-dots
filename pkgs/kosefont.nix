{ stdenv, fetchurl }: stdenv.mkDerivation rec {
  pname = "KosefontJPNerdFont";
  version = "1.0";

  src = fetchurl {
    url = "https://tilde.club/~aishenreemo/public/KosefontJPNerdFont-Regular.ttf";
    sha256 = "01812zk1p52ribqsdv575xn60kb6kk3lfz39j0mw6d23lh71va3f";
  };

  unpackPhase = "true";

  installPhase = ''
    mkdir -p $out/share/fonts
    cp $src $out/share/fonts/
  '';

  meta = {
    description = "Kosefont Japanese Nerd Font";
  };
}
