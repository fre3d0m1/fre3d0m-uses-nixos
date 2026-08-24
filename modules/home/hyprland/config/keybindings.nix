{ pkgs, lib, ... }:
let
    mainMod = "SUPER";
    screenshotTool = "hyprshot";
    terminal = "kitty";
    programPicker = "rofi -show drun";
    locker = "hyprlock";

    makeKeybind = keybind: action: {
      _args = [ keybind (lib.generators.mkLuaInline action) ];
    };

    makeKeybindOpts = keybind: action: opts: {
      _args = [ 
        keybind 
        (lib.generators.mkLuaInline action) 
        (lib.generators.mkLuaInline (lib.generators.toLua {} opts)) 
      ];
    };
in
{
    wayland.windowManager.hyprland.settings = {
        bind = [
            # Utility
            (makeKeybind "${mainMod} + PRINT" "hl.dsp.exec_cmd(\"${screenshotTool} -m window\")")
            (makeKeybind "PRINT" "hl.dsp.exec_cmd(\"${screenshotTool} -m output\")")
            (makeKeybind "${mainMod} + SHIFT + PRINT" "hl.dsp.exec_cmd(\"${screenshotTool} -m region\")")

            (makeKeybind "${mainMod} + Q" "hl.dsp.exec_cmd(\"${terminal}\")")

            (makeKeybind "${mainMod} + D" "hl.dsp.exec_cmd(\"${programPicker}\")")

            (makeKeybind "${mainMod} + L" "hl.dsp.exec_cmd(\"${locker}\")")
            
            # Window-specific
            (makeKeybind "${mainMod} + V" "hl.dsp.window.float({ action = \"toggle\" })")

            (makeKeybind "${mainMod} + C" "hl.dsp.window.close()")
            
            (makeKeybind "${mainMod} + mouse_down" "hl.dsp.focus({ workspace = \"e+1\" })")
            (makeKeybind "${mainMod} + mouse_up" "hl.dsp.focus({ workspace = \"e-1\" })")

            (makeKeybindOpts "${mainMod} + mouse:272" "hl.dsp.window.drag()" { mouse = true; })
            (makeKeybindOpts "${mainMod} + mouse:273" "hl.dsp.window.resize()" { mouse = true; })

            # Multimedia keys for volume and LCD brightness
            (makeKeybindOpts 
                "XF86AudioRaiseVolume" 
                "hl.dsp.exec_cmd(\"wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+\")" 
                { mouse = true; }
            )

        ] ++ (
          lib.concatMap (i:
            let
              key = toString (lib.mod i 10);
              index = toString i;
            in
            [
              (makeKeybind "${mainMod} + ${key}" "hl.dsp.focus({ workspace = ${index} })")
              (makeKeybind "${mainMod} + SHIFT + ${key}" "hl.dsp.window.move({ workspace = ${index} })")
            ]
          ) (lib.range 1 10)
        );
  };
}
