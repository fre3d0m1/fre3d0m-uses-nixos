{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    window_rule = [
      {
        name = "godot-playing-float-2";
        match.class = "^Special Agent: Rogue$";
        float = true;
        center = true;
        fullscreen = false;
        maximize = false;
      }
      {
        name = "godot-playing-float";
        match.class = "^Retail-Talk$";
        float = true;
        center = true;
        fullscreen = false;
        maximize = false;
      }
      {
        name = "godot-playing-background-float";
        match = {
          initial_class = "Godot";
          initial_title = ".*(DEBUG).*";
        };
        float = true;
        center = true;
        fullscreen = false;
        maximize = false;
      }
      # Fix some dragging issues with XWayland
      {
        name = "fix-xwayland-drags";
        match = {
          class = "^$";
          title = "^$";
          xwayland = true;
          float = true;
          fullscreen = false;
          pin = false;
        };
        no_focus = true;
      }
      # Hyprland-run windowrule
      {
        name = "move-hyprland-run";
        match.class = "hyprland-run";
        move = "20 monitor_h-120";
        float = true;
      }
    ];
  };
}
