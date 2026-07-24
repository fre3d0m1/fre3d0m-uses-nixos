{ ... }:
{
    services = {
        xserver = {
            enable = true;
            xkb.layout = "us,fr";
        };

        libinput = {
            enable = true;
        };
    };
}
