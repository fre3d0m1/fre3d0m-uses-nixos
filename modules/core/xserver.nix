{ ... }:
{
    services = {
        xserver = {
            enable = true;
            xkb.layout = "us,fr";
        };

        displayManager.autoLogin = {
            enable = true;
            user = "fre3d0m";
        };
        libinput = {
            enable = true;
        };
    };
}
