
{ ... }:
{
    imports = [
        ./config
    ];

    wayland.windowManager.hyprland.systemd.enable = false;

    wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;
    };
}
