{ osConfig, lib, ... }:
let
  isDesktop = osConfig.networking.hostName == "fre3d0m-uses-nixos";
in
{
  wayland.windowManager.hyprland.settings.monitor =
    if isDesktop then
      [
        {
          output = "DP-1";
          mode = "2560x1440@180.00Hz";
          position = "0x0";
          scale = "1";
          bitdepth = 10;
          cm = "hdr";
          sdrbrightness = 1.5;
          sdrsaturation = 1;
          max_luminance = 1000;
          min_luminance = 0;
          sdr_max_luminance = 250;
          sdr_min_luminance = 0;
        }
      ]
    else
      [
        {
          output = "eDP-1";
          mode = "1920x1080@60";
          position = "0x0";
          scale = "1";
        }
      ];
}
