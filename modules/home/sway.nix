{ pkgs, inputs, ... }:
{
  wayland.windowManager.sway = {
    enable = true;

    config = {
      output = {
        "DP-1" = {
          mode = "2560x1440@180hz";
          render_bit_depth = "10";
          hdr = "off";
        };
      };

      modifier = "Mod4";
      terminal = "kitty";
      keybindings = {
        "Mod4+q" = "exec kitty";
        "Mod4+Shift+c" = "reload";
        "Mod4+d" = "exec rofi -show drun";
        "Mod4+Shift+e" = "exec swaynag -t warning -m 'Exit sway?' -B 'Yes, exit' 'swaymsg exit'";

        "Mod4+n" = "exec swaync-client -t -sw";

        "Mod4+f" = "fullscreen toggle";

        "Mod4+c" = "kill";

        "Mod4+Shift+t" = "exec swaymsg output DP-1 hdr toggle";

        "Mod4+1" = "workspace number 1";
        "Mod4+2" = "workspace number 2";
        "Mod4+3" = "workspace number 3";
        "Mod4+4" = "workspace number 4";
        "Mod4+5" = "workspace number 5";
        "Mod4+6" = "workspace number 6";
        "Mod4+7" = "workspace number 7";
        "Mod4+8" = "workspace number 8";
        "Mod4+9" = "workspace number 9";
        "Mod4+0" = "workspace number 10";

        "Mod4+Shift+1" = "move container to workspace number 1";
        "Mod4+Shift+2" = "move container to workspace number 2";
        "Mod4+Shift+3" = "move container to workspace number 3";
        "Mod4+Shift+4" = "move container to workspace number 4";
        "Mod4+Shift+5" = "move container to workspace number 5";
        "Mod4+Shift+6" = "move container to workspace number 6";
        "Mod4+Shift+7" = "move container to workspace number 7";
        "Mod4+Shift+8" = "move container to workspace number 8";
        "Mod4+Shift+9" = "move container to workspace number 9";

        "Mod4+Shift+space" = "floating toggle";

        "Print" = "exec grim /home/fre3d0m/Pictures/screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png";
        "Mod4+Shift+Print" =
          "exec grim -g \"$(slurp)\" /home/fre3d0m/Pictures/screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png";
      };

      bars = [ ];

      startup = [
        { command = "waybar"; }
        { command = "swaync"; }
        { command = "swaymsg workspace 1"; }
        {
          command = "swaybg -m fill -i /home/fre3d0m/Pictures/wallpapers/1293076.png";
        }
        {
          command = ''
            swayidle -w \
              timeout 300 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \
              timeout 600 'swaylock -f' \
              before-sleep 'swaylock -f'
          '';
        }
      ];

      colors = {
        focused = {
          border = "#3a7099";
          background = "#2a536f";
          text = "#e6e6e6";
          indicator = "#3f7aa6";
          childBorder = "#3f7aa6";
        };
        focusedInactive = {
          border = "#4e4e4e";
          background = "#3c3c3c";
          text = "#e6e6e6";
          indicator = "#242424";
          childBorder = "#242424";
        };
        unfocused = {
          border = "#242424";
          background = "#1f1f1f";
          text = "#e6e6e6";
          indicator = "#242424";
          childBorder = "#242424";
        };
        urgent = {
          border = "#a82424";
          background = "#7a1f1f";
          text = "#e6e6e6";
          indicator = "#a82424";
          childBorder = "#a82424";
        };
      };

      window.border = 1;
      window.titlebar = false; # optional, depending on whether you want pixel borders

    };
  };
}
