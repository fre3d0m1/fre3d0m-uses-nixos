{ config, lib,... }:
{
    wayland.windowManager.hyprland.settings = {
        env = [
          { _args = ["HYPRCURSOR_THEME" "24"]; }
          { _args = ["XCURSOR_THEME" "catppuccin-mocha-dark-cursors"]; }
          { _args = ["XCURSOR_SIZE" "24"]; }
          
          { _args = ["LIBVA_DRIVER_NAME" "nvidia"]; }
          { _args = ["__GLX_VENDOR_LIBRARY_NAME" "nvidia"]; }

          { _args = ["NIXOS_OZONE_WL" "1"]; }
          { _args = ["ELECTRON_OZONE_PLATFORM_HINT" "auto"]; }

          { _args = ["HYPRSHOT_DIR" "${config.home.homeDirectory}/Pictures/Screenshots/"]; }
        ];
    };
}
