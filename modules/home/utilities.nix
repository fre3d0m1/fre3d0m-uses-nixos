{ pkgs, ... }:
{
    home.packages = with pkgs; [
        unzip
        fastfetch
        vlc
    ];   
}
