{ pkgs, ... }:
{
    boot = {
        loader = {
            efi.canTouchEfiVariables = true;
        };

        kernelParams = [
            "profile"
        ];
    };
}
