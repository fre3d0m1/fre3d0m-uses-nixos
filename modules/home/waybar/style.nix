{ ... }:
let
  custom = {
    font = "Maple Mono";
    font_size = "18px";
    font_weight = "bold";
    text_color = "#FEFEFE";
    background_0 = "#1D2021";
    background_1 = "#282828";
    border_color = "#A89984";
    red = "#CC241D";
    green = "#98971A";
    yellow = "#FABD2F";
    blue = "#1666BF";
    magenta = "#B16286";
    cyan = "#00BBD3";
    orange = "#D65D0E";
    orange_bright = "#FE8019";
    opacity = "1";
    indicator_height = "2px";
    transparent_opacity = "0.65";
    white = "#f7f9f9";
    black = "#212121";
  };
in
{
  programs.waybar.style = with custom; ''
    * {
      /* General taskbar font, I like maple mono ^-^*/
      font-family: Maple Mono;
      border-radius: 8;
      font-size: 15px;
      padding: 0px;
      background: transparent;
    }

    window#waybar {
      /* Linear gradients are used because it makes less harsh rounded border radius, gtk bug :p */
      background-image: linear-gradient(to bottom, #141216 100%);
      border-radius: 14px;
      padding: 0px;
      border-style: none;
    }

    #battery,
    #network,
    #clock,
    #language,
    #custom-applauncher,
    #tray,
    #pulseaudio {
      background-image: linear-gradient(to bottom, #27232b 100%);

      margin: 6px;
      margin-right: 0px;
      padding: 4px 8px;
      border-radius: 8px;
      color: ${white};

      border-style: none;
      transition-duration: 120ms;
    }

    #clock {
      margin-right: 6px;
    }

    #pulseaudio:hover {
      background-image: linear-gradient(to bottom, #ac82e9 100%);
      color: #141216;
      transition-duration: 120ms;
    }

    #custom-applauncher {
      font-weight: bold;
      transition-duration: 120ms;
    }
    #custom-applauncher:hover {
      background-image: linear-gradient(to bottom, #ac82e9 100%);
      color: #141216;
      transition-duration: 120ms;
    }

    #tray menu {
      background-color: #141216;
      color: #d8cab8;
      padding: 4px;
    }
    #tray menu menuitem {
      background-image: linear-gradient(to bottom, #27232b 100%);

      margin: 3px;
      color: #d8cab8;
      border-radius: 4px;
      border-style: solid;
      border-color: #27232b;
    }
    #tray menu menuitem:hover {
      background-image: linear-gradient(to bottom, #27232b 100%);
      color: #ac82e9;
      font-weight: bold;
    }

    #workspaces button {
      transition-duration: 100ms;
      all: initial;
      min-width: 0;
      font-weight: bold;
      color: #3d3d3d;
      margin: 6px 3px;
      padding: 6px;
      border-radius: 4px;
      background-image: linear-gradient(to bottom, #27232b 100%);
    }

    #workspaces button:hover {
      transition-duration: 120ms;
      color: ${white};
    }
    #workspaces button.focused {
      color: ${white};
      font-weight: bold;
    }
    #workspaces button.active {
      color: ${white};
      font-weight: bold;
    }
    #workspaces button.urgent {
      color: ${white};
    }

    #battery {
      background-color: #222222;
      color: #1d2021;
    }
    #battery.warning,
    #battery.critical,
    #battery.urgent {
      color: #1d2021;
      background-color: #fc4649;
    }
  '';
}
