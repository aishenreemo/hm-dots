{ stdenv, lib }: stdenv.mkDerivation rec {
  pname = "mako-sound";
  version = "1.0";

  # no source needed
  src = null;
  unpackPhase = "true";

  installPhase = ''
    mkdir -p $out/bin
    cat > $out/bin/mako-sound <<'EOF'
    #!/bin/sh
    pkill -f pw-play 2>/dev/null
    exec pw-play "$XDG_CONFIG_HOME/home-manager/sounds/early-summer-notification.wav"
    EOF
    chmod +x $out/bin/mako-sound
  '';

  meta = {
    description = "Notification sound helper for Mako that plays a .wav via PipeWire";
    homepage = "https://github.com/aishenreemo";
    license = lib.licenses.mit;
    maintainers = [ "aishenreemo" ];
    platforms = lib.platforms.linux;
  };
}
