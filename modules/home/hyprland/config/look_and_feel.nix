{ ... }:
let
    makeCurve = speed: properties: {
      _args = [ speed properties ];
    };
in
{
    wayland.windowManager.hyprland.settings = {
        config = {
          general = {
            gaps_in = 5;
            gaps_out = 20;
            border_size = 2;

            "col.active_border" = "rgba(d8cab8ff)";
            "col.inactive_border" = "rgba(0D0D0Dff)";

            resize_on_border = false;
            allow_tearing = true;
            layout = "dwindle";
          };

          decoration = {
            rounding = 10;
            rounding_power = 2;

            active_opacity = 1.0;
            inactive_opacity = 1.0;

            shadow = {
              enabled = true;
              range = 4;
              render_power = 3;
              color = "0xee1a1a1a";
            };

            blur = {
              enabled = true;
              size = 3;
              passes = 1;
              vibrancy = 0.1696;
            };
          };

          cursor = {
            no_hardware_cursors = true;
          };

          xwayland = {
            force_zero_scaling = true;
          };

          render = {
            direct_scanout = false;
          };
          dwindle = {
            preserve_split = true;
          };

          master = {
            new_status = "master";
          };

          scrolling = {
            fullscreen_on_one_column = true;
          };

          misc = {
            force_default_wallpaper = -1;
            disable_hyprland_logo = false;
          };

          animations = {
            enabled = true;
          };
        };

        curve = [
          (makeCurve "easeOutQuint" { type = "bezier"; points = [ [ 0.23 1 ] [ 0.32 1 ] ]; })
          (makeCurve "easeInOutQuint" { type = "bezier"; points = [ [ 0.65 0.05 ] [ 0.36 1 ] ]; })
          (makeCurve "linear" { type = "bezier"; points = [ [ 0 0 ] [ 1 1 ] ]; })
          (makeCurve "almostLinear" { type = "bezier"; points = [ [ 0.5 0.5 ] [ 0.75 1 ] ]; })
          (makeCurve "quick" { type = "bezier"; points = [ [ 0.15 0 ] [ 0.1 1 ] ]; })

          (makeCurve "easy" { type = "spring"; mass = 1; stiffness = 71.2633; dampening = 15.8273644; })
        ];

        animation = [
          { leaf = "global"; enabled = true; speed = 10; bezier = "default"; }
          { leaf = "border"; enabled = true; speed = 5.39; bezier = "easeOutQuint"; }
          { leaf = "windows"; enabled = true; speed = 4.79; spring = "easy"; }
          { leaf = "windowsIn"; enabled = true; speed = 4.1; spring = "easy"; style = "popin 87%"; }
          { leaf = "windowsOut"; enabled = true; speed = 1.49; bezier = "linear"; style = "popin 87%"; }
          { leaf = "fadeIn"; enabled = true; speed = 1.73; bezier = "almostLinear"; }
          { leaf = "fadeOut"; enabled = true; speed = 1.46; bezier = "almostLinear"; }
          { leaf = "fade"; enabled = true; speed = 3.03; bezier = "quick"; }
          { leaf = "layers"; enabled = true; speed = 3.81; bezier = "easeOutQuint"; }
          { leaf = "layersIn"; enabled = true; speed = 4; bezier = "easeOutQuint"; style = "fade"; }
          { leaf = "layersOut"; enabled = true; speed = 1.5; bezier = "linear"; style = "fade"; }
          { leaf = "fadeLayersIn"; enabled = true; speed = 1.79; bezier = "almostLinear"; }
          { leaf = "fadeLayersOut"; enabled = true; speed = 1.39; bezier = "almostLinear"; }
          { leaf = "workspaces"; enabled = true; speed = 1.94; bezier = "almostLinear"; style = "fade"; }
          { leaf = "workspacesIn"; enabled = true; speed = 1.21; bezier = "almostLinear"; style = "fade"; }
          { leaf = "workspacesOut"; enabled = true; speed = 1.94; bezier = "almostLinear"; style = "fade"; }
          { leaf = "zoomFactor"; enabled = true; speed = 7; bezier = "quick"; }
        ];
    };
}
