{ voxtype-pkg, model }:
{
  enable = true;
  model.name = model;
  package = voxtype-pkg;
  service.enable = true;
  settings = {
    audio = {
      device = "default";
      feedback.enabled = false;
      max_duration_secs = 60;
      sample_rate = 16000;
    };
    hotkey.enabled = false;
    output = {
      mode = "type";
      notification = {
        on_recording_start = true;
        on_recording_stop = true;
        on_transcription = true;
      };
    };
    whisper = {
      language = "auto";
      translate = false;
    };
  };
}
