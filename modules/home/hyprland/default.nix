{ ... }:
{
    wayland.windowManager.hyprland.systemd.enable = false;

    imports = [
        ./settings.nix
        ./hyprshot.nix
        ./hyprpaper.nix
        ./hypridle.nix
        ./hyprlock.nix
    ];
}
