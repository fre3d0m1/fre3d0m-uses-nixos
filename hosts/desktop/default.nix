{ ... }:
{
    imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      ./../../modules/core
    ];

    # Allow for my desktop to dual boot Windows and Linux
    boot.loader.grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
    };

}
