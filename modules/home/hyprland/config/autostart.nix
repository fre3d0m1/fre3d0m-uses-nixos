{ pkgs, lib, ... }:
{
    wayland.windowManager.hyprland.settings = {
      on = {
        _args = [
          "hyprland.start"
          (lib.generators.mkLuaInline "function()\n  hl.exec_cmd(\"waybar\") hl.exec_cmd(\"hyprpaper\") hl.exec_cmd(\"hypridle\") \nend")
        ];
      };
    };
}
