{ osConfig, lib, ...}:
let
    isDesktop = osConfig.networking.hostName == "fre3d0m-uses-nixos";
in
{
    wayland.windowManager.hyprland.settings.monitor = 
        if isDesktop then [
        {
            output = "DP-1";
            mode = "modeline 768.50 2560 2608 2640 2720 1440 1443 1448 1570 +hsync -vsync";
            position = "0x0";
            scale = "1";
            bitdepth = 10;
            cm = "hdr";
            sdrbrightness = 5;
            sdrsaturation = 1.2;
        }
    ] else [
        {
            output = "eDP-1";
            mode = "1920x1080@60";
            position = "0x0";
            scale = "1";
        }
    ];
}
