{ pkgs, config, ... }: {
  services.mpd.enable = true;
  services.mpd.musicDirectory = "${config.home.homeDirectory}/music";
  services.mpd.dbFile = "${config.xdg.configHome}/mpd/database";
  services.mpd.playlistDirectory = "${config.xdg.configHome}/mpd/playlists";
  services.mpd.extraConfig = ''
    log_file            "~/.config/mpd/log"
    pid_file            "~/.config/mpd/pid"
    state_file          "~/.config/mpd/state"
    sticker_file        "~/.config/mpd/sticker.sql"
    
    decoder {
      plugin "ffmpeg"
      enabled "yes"
    }
    
    audio_output {
      type        "pipewire"
      name        "audio output"
    }

    audio_output {
      type            "fifo"
      name            "visualizer fifo"
      path            "/tmp/mpd.fifo"
      format          "44100:16:2"
    }
  '';

  programs.ncmpcpp = {
    enable = true;
    package = pkgs.ncmpcpp.override {
      visualizerSupport = true;
      taglibSupport = true;  # optional but nice to have
    };
    settings = {
      visualizer_data_source = "/tmp/mpd.fifo";
      visualizer_output_name = "visualizer fifo";
      visualizer_type = "spectrum";
      visualizer_color = "cyan";
      visualizer_fps = "60";
    };
  };
}
