{ pkgs, ... }:
{
    home.packages = with pkgs; [ 
        librewolf
        firefox
    ];

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
