{ pkgs, host, ... }:
{
    networking = {
        hostName = "fre3d0m-uses-nixos";
        networkmanager.enable = true;
    };
}
