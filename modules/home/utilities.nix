{ pkgs, ... }:
{
    home.packages = with pkgs; [
        unzip
        fastfetch
        vlc
        pureref
        # Audio control
        pavucontrol
        # Image viewer
        imv
    ];   
}
