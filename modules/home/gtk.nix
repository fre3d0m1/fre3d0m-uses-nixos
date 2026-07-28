{ pkgs, lib, ... }:
{

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "Tokyonight-Dark";
      icon-theme = "Papirus-Dark";
      color-scheme = "prefer-dark";
    };
  };


  gtk = {
    enable = true;

    colorScheme = "dark";

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme.override {
          color = "black";
      };
    };

    theme = {
      name = "Tokyonight-Dark";
      package = pkgs.tokyonight-gtk-theme.override {
          colorVariants = [ "dark" ];
      };
    };

    gtk4 = {
      theme = {
        name = "Tokyonight-Dark";
        package = pkgs.tokyonight-gtk-theme.override {
          colorVariants = [ "dark" ];
        };
      };
      extraConfig = {
        gtk-application-prefer-dark-theme = lib.mkForce true;
      };
    };
  };
}
