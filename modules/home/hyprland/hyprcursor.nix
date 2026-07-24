{ pkgs, ... }:
{
    home.pointerCursor = { 
        hyprcursor.enable = true;
        gtk.enable = true;
        x11.enable = true;
        package = pkgs.catppuccin-cursors.mochaSky;
        name = "Catppuccin Mocha Sky";
        size = 24;
    };

  home.sessionVariables = {
    XCURSOR_THEME = "catppuccin-mocha-sky-cursors";
    XCURSOR_SIZE = "24";
    HYPRCURSOR_THEME = "catppuccin-mocha-sky-cursors";
    HYPRCURSOR_SIZE = "24";
    NIXOS_OZONE_WL = "1"; # Force Electron apps to Wayland
  };
}
