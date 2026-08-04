{ pkgs, ... }:
{
    services = {
        upower.enable = true;

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
    };
    

    # OpenRGB
    boot.kernelModules = [ "i2c-dev" "i2c-piix4" ];

    hardware.i2c.enable = true;
    users.users.fre3d0m.extraGroups = [ "i2c" ];

}
