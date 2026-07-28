{ pkgs, ... }:
{
    stylix = {
        enable = false;
        polarity = "dark";
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
        icons = {
          enable = true;
          package = pkgs.papirus-icon-theme;
          dark = "Papirus-Dark";
        };
        fonts.sizes = {
            applications = 10;
            terminal = 10;
            desktop = 8;
            popups = 8;
        };
    };
}
