{ pkgs, lib, ... }:
{
  gtk = {
    enable = true;
    colorScheme = "dark";

    iconTheme = {
      name = "Dracula";
      package = pkgs.dracula-icon-theme;
    };

    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };

    gtk4 = {
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };
      extraConfig = {
        gtk-application-prefer-dark-theme = lib.mkForce true;
      };
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
