{ lib, ... }:
{
    imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../modules/core
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    time.hardwareClockInLocalTime = true;

    networking.networkmanager.enable = lib.mkForce false;

    # Enable systemd-networkd for instant Ethernet setup
    networking.useNetworkd = true;

    systemd.network.enable = true;
    systemd.services.systemd-networkd-persistent-storage.enable = false;
    # Simple DHCP configuration for Ethernet interfaces
    systemd.network.networks."10-ethernet" = {
      matchConfig.Name = "en*"; # Matches eth0, enp3s0, etc.
      networkConfig.DHCP = "ipv4";
    };

}

