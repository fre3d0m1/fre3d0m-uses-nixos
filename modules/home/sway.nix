{ ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod4";
      terminal = "kitty";
      keybindings = {
        "Mod4+q" = "exec kitty";
        "Mod4+Shift+c" = "reload";
        "Mod4+d" = "exec rofi -show drun";
        "Mod4+Shift+e" = "exec swaynag -t warning -m 'Exit sway?' -B 'Yes, exit' 'swaymsg exit'";
      };
      startup = [
        { command = "waybar"; }
      ];
    };
  };
}
