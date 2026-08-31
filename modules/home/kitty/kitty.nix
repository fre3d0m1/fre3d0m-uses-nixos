{ ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      input_delay = 0;
      repaint_delay = 2;
      sync_to_monitor = "no";
      wayland_enable_ime = "no";

      background_opacity = "0.5";
      font_family = "family=\"Maple Mono NF\"";
    };
  };
}
