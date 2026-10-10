{ pkgs, ... }:
{

  home.packages = with pkgs; [
    firefox
  ];

  programs.librewolf = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        isDefault = true;
        settings = {
          # Required for Stylix userChrome.css to take effect
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "svg.context-properties.content.enabled" = true;
        };
        extensions.force = true;
      };
      old-default = {
        id = 1;
        isDefault = false;
      };
    };
  };

  stylix.targets.librewolf = {
    enable = true;
    profileNames = [ "default" ];

    colorTheme.enable = true;
  };

  xdg.desktopEntries.librewolf = {
    name = "LibreWolf";
    exec = "${pkgs.librewolf}/bin/librewolf";
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "librewolf.desktop";
      "x-scheme-handler/http" = "librewolf.desktop";
      "x-scheme-handler/https" = "librewolf.desktop";
      "x-scheme-handler/about" = "librewolf.desktop";
      "x-scheme-handler/unknown" = "librewolf.desktop";
    };
  };
}
