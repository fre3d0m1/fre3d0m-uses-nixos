{ pkgs, ... }:
{
  programs.hyprland.withUWSM = true;
  programs.dconf.enable = true;

  xdg.portal = {
    enable = true;

    config = {
      common.default = [ "gtk" ];
      hyprland.default = [
        "gtk"
        "hyprland"
      ];
    };

    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";

      # Crucial NVIDIA settings for Hyprland
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE = "wayland";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    
    # Prevents crash/invisible cursor issues on NVIDIA
    WLR_NO_HARDWARE_CURSORS = "1";
  };
}
