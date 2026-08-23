{ pkgs, lib, ... }:
let
    mainMod = "SUPER";
    hyprshot = "hyprshot";
    terminal = "kitty";
    programPicker = "rofi -show drun";
    hyprlock = "hyprlock";

    # Generates 1 to 10
    workspaces = builtins.genList (x: x + 1) 10;

    # Maps workspace index to key string (10 becomes "0")
    wsKey = i: toString (if i == 10 then 0 else i);

    workspaceBindsLua = lib.concatMapStringsSep "\n" (i: ''
    hl.bind("${mainMod} + ${wsKey i}", hl.dsp.focus({ workspace = ${toString i} }))
    hl.bind("${mainMod} + SHIFT + ${wsKey i}", hl.dsp.window.move({ workspace = ${toString i} }))
  '') workspaces;
in
{
    wayland.windowManager.hyprland.settings = {
        bind = [
            # Screenshot tool
            {
              _args = [
                "SUPER + PRINT"
                (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"hyprshot -m window\")")
              ];
            }
            {
              _args = [
                "PRINT"
                (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"hyprshot -m output\")")
              ];
            }
            {
              _args = [
                "SUPER + SHIFT + PRINT"
                (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"hyprshot -m region\")")
              ];
            }
            {
              _args = [
                "SUPER + Q"
                (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${terminal}\")")
              ];
            }
            {
              _args = [
                "SUPER + D"
                (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${programPicker}\")")
              ];
            }
            {
              _args = [
                "SUPER + L"
                (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${hyprlock}\")")
              ];
            }
            {
              _args = [
                "SUPER + V"
                (lib.generators.mkLuaInline "hl.dsp.window.float({ action = \"toggle\" })")
              ];
            }
            {
              _args = [
                "SUPER + C"
                (lib.generators.mkLuaInline "hl.dsp.window.close()")
              ];
            }
        ];
      
  };
}
