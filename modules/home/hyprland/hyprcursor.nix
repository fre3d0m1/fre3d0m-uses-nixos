{ pkgs, ... }:
{
    home.pointerCursor = { 
        hyprcursor.enable = true;
        gtk.enable = true;
        x11.enable = true;
        package = pkgs.catppuccin-cursors.mochaSky;
        name = "Catppuccin Mocha Dark";
        size = 24;
    };

  home.sessionVariables = {
    XCURSOR_THEME = "catppuccin-mocha-dark-cursors";
    XCURSOR_SIZE = "24";
    HYPRCURSOR_THEME = "catppuccin-mocha-dark-cursors";
    HYPRCURSOR_SIZE = "24";
    NIXOS_OZONE_WL = "1"; # Force Electron apps to Wayland
    LD_LIBRARY_PATH= "/run/current-system/sw/share/nix-ld/lib:$LD_LIBRARY_PATH";
  };
}
