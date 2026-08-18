{ pkgs, ... }:
{
    services = {
        weechat.enable = true;
        hypridle.enable = true;
        upower.enable = true;
        flatpak.enable = true;

        tailscale.enable = true;

        printing.enable = true;

        flaresolverr = {
            enable = true;
            port = 8191;
        };
        prowlarr.enable = true;

        hardware.openrgb = { 
          enable = true; 
          package = pkgs.openrgb-with-all-plugins; 
          motherboard = "amd"; 
          server.port = 6742; 
        };

        gvfs.enable = true;
        udisks2.enable = true;

        xserver.xkb = {
          layout = "us,jp,ca";
          # Note that the trailing comma is required: https://github.com/NixOS/nixpkgs/issues/359830
          variant = "workman,,";
          options = "grp:win_space_toggle";
        };

    };
    

    # OpenRGB
    boot.kernelModules = [ "i2c-dev" "i2c-piix4" ];

    hardware.i2c.enable = true;
    users.users.fre3d0m.extraGroups = [ "i2c" ];
    
    i18n.inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [ fcitx5-mozc fcitx5-gtk ];
      };
    };

}
