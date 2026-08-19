{ pkgs, ... }:
{
    home.pointerCursor = { 
        hyprcursor.enable = true;
        gtk.enable = true;
        x11.enable = true;
        package = pkgs.catppuccin-cursors.mochaDark;
        name = "catppuccin-mocha-dark-cursors";
        size = 24;
    };

    gtk.enable = true;

  home.sessionVariables = {
    XCURSOR_THEME = "catppuccin-mocha-dark-cursors";
    XCURSOR_SIZE = "24";
    HYPRCURSOR_THEME = "catppuccin-mocha-dark-cursors";
    HYPRCURSOR_SIZE = "24";
    NIXOS_OZONE_WL = "1"; # Force Electron apps to Wayland

    XCURSOR_PATH = "$HOME/.icons:$HOME/.nix-profile/share/icons:/run/current-system/sw/share/icons";
    LD_LIBRARY_PATH= "/run/current-system/sw/share/nix-ld/lib:$LD_LIBRARY_PATH";
  };
}
