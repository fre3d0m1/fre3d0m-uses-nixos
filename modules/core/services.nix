{ ... }:
{
    services = {
        tailscale.enable = true;

        printing.enable = true;

        flaresolverr = {
            enable = true;
            port = 8191;
        };
        prowlarr.enable = true;
    };
}
