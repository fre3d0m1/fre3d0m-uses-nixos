{ pkgs, ...}:
{
    # Enable OpenTabletDriver hardware service
  hardware.opentabletdriver.enable = true;

  # Required for OpenTabletDriver to emulate mouse/pen input
  hardware.uinput.enable = true;
  boot.kernelModules = [ "uinput" ];
}
