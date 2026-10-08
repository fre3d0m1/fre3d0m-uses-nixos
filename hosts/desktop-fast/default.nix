{ lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.hardwareClockInLocalTime = true;

  # Enable NetworkManager and disable systemd-networkd conflicts
  networking.networkmanager.enable = true;
  networking.useNetworkd = false;
  systemd.network.enable = false;

  # Let NetworkManager handle DHCP natively
  networking.useDHCP = false;
  networking.interfaces.enp10s0.useDHCP = false;
  networking.interfaces.wlp9s0.useDHCP = false;
}
