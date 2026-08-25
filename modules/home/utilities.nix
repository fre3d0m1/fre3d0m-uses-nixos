{ pkgs, ... }:
{
    home.packages = with pkgs; [
        unzip
        fastfetch
        vlc
        pureref
        pavucontrol
        imv
        unrar
        anki
        efibootmgr
    ];   
}
