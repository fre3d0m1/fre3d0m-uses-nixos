{ pkgs, ... }:
{
    home.packages = with pkgs; [ hyprshot ];
    home.sessionVariables = {
        HYPRSHOT_DIR = "/home/fre3d0m/Pictures/Screenshots/";
    }; 
}

