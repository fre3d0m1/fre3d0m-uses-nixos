{ pkgs, ... }:
{
    wayland.windowManager.hyprland.systemd.enable = false;
    
    home.packages = with pkgs; [
        hyprshutdown
    ];

    imports = [
        ./settings.nix
        ./hyprshot.nix
        ./hyprpaper.nix
        ./hypridle.nix
        ./hyprlock.nix
    ];
}
