{ pkgs, ... }:
{
  imports = [
    ./settings.nix
    ./style.nix
  ];

  home.packages = with pkgs; [
    swaybg
  ];

  programs.waybar.enable = true;
}
