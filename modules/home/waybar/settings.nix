{ host, ... }:
let
  custom = {
    font = "Maple Mono";
    font_size = "18px";
    font_weight = "bold";
    text_color = "#FBF1C7";
    background_0 = "#1D2021";
    background_1 = "#282828";
    border_color = "#928374";
    red = "#CC241D";
    green = "#98971A";
    yellow = "#FABD2F";
    blue = "#458588";
    magenta = "#B16286";
    cyan = "#689D6A";
    orange = "#D65D0E";
    opacity = "1";
    indicator_height = "2px";
  };
in
{
  programs.waybar.settings.mainBar = with custom; {
    position = "top";
    layer = "top";
    height = 28;
    margin-top = 15;
    margin-bottom = 0;
    margin-left = 500;
    margin-right = 500;
    modules-left = [
      "hyprland/workspaces"
    ];
    modules-center = [ "clock" ];
    modules-right = [
      "hyprland/language"
      "network"
      "battery"
      "pulseaudio"
      "tray"
    ];
    clock = {
      calendar = {
        format = {
          today = "<span color='#98971A'><b>{}</b></span>";
        };
      };
      format = "{:%H:%M}";
      tooltip = "true";
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      format-alt = "{:%d/%m}";
    };
    "hyprland/workspaces" = {
      active-only = false;
      disable-scroll = true;
      format = "{icon}";
      on-click = "activate";
      format-icons = {
        "1" = "I";
        "2" = "II";
        "3" = "III";
        "4" = "IV";
        "5" = "V";
        "6" = "VI";
        "7" = "VII";
        "8" = "VIII";
        "9" = "IX";
        "10" = "X";
        sort-by-number = true;
      };
    };
    network = {
      format-wifi = "  {bandwidthDownBits}";
      format-ethernet = "  {bandwidthDownBits}";
      format-disconnected = "󰤮  No Network";
      tooltip = false;
    };
    tray = {
      icon-size = 20;
      spacing = 8;
    };
    pulseaudio = {
      scroll-step = 5;
      max-volume = 100;
      format = "{icon} {volume}%";
      format-bluetooth = "{icon} {volume}%";
      format-icons = [
        ""
        ""
        " "
      ];
      nospacing = 1;
      format-muted = " ";
      on-click = "pavucontrol";
      tooltip = false;
    };
    battery = {
      format = "<span foreground='${yellow}'>{icon}</span> {capacity}%";
      format-icons = [
        " "
        " "
        " "
        " "
        " "
      ];
      format-charging = "<span foreground='${yellow}'> </span>{capacity}%";
      format-full = "<span foreground='${yellow}'> </span>{capacity}%";
      format-warning = "<span foreground='${yellow}'> </span>{capacity}%";
      interval = 5;
      states = {
        warning = 20;
      };
      format-time = "{H}h{M}m";
      tooltip = true;
      tooltip-format = "{time}";
    };
    "hyprland/language" = {
      tooltip = true;
      tooltip-format = "Keyboard layout";
      format = "<span foreground='#FABD2F'> </span> {}";
      format-fr = "FR";
      format-en = "US";
      format-ca = "CA";
      format-jp = "JP";
      on-click = "hyprctl switchxkblayout at-translated-set-2-keyboard next";
    };
    "custom/launcher" = {
      format = "";
      on-click = "random-wallpaper";
      on-click-right = "rofi -show drun";
      tooltip = "true";
      tooltip-format = "Random Wallpaper";
    };
    "custom/notification" = {
      tooltip = true;
      tooltip-format = "Notifications";
      format = "{icon}";
      format-icons = {
        notification = "<span foreground='red'><sup></sup></span>";
        none = "";
        dnd-notification = "<span foreground='red'><sup></sup></span>";
        dnd-none = "";
        inhibited-notification = "<span foreground='red'><sup></sup></span>";
        inhibited-none = "";
        dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
        dnd-inhibited-none = "";
      };
      return-type = "json";
      exec-if = "which swaync-client";
      exec = "swaync-client -swb";
      on-click = "swaync-client -t -sw";
      on-click-right = "swaync-client -d -sw";
      escape = true;
    };
    "custom/power-menu" = {
      tooltip = true;
      tooltip-format = "Power menu";
      format = "<span foreground='${red}'> </span>";
      on-click = "power-menu";
    };
  };
}
