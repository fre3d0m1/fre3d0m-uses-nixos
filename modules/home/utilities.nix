{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jetbrains.idea
    jetbrains.webstorm
    unzip
    fastfetch
    vlc
    pureref
    pavucontrol
    imv
    unrar
    anki
    efibootmgr
    protonup-qt
    appimage-run
  ];
}
