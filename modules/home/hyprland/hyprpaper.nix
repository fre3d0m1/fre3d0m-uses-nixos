{ pkgs, ... }:
{
    services.hyprpaper = {
        enable = true;
        settings = {
            wallpaper = [
                {
                    monitor = "DP-1";
                    path = "/home/fre3d0m/fre3d0m-uses-nixos/wallpapers/oc_the_blackboard.png";
                    fit_mode = "cover";
                    order = "random";
                }
            ];
        };
    };

    home.packages = with pkgs; [
        hyprpaper
    ];
}
