{ inputs, pkgs, ... }:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.fre3d0m = {
      imports = [ ./../home ];
      home.username = "fre3d0m";
      home.homeDirectory = "/home/fre3d0m";
      home.stateVersion = "26.05";
      programs.home-manager.enable = true;
    };
  };
  users.users."fre3d0m" = {
    isNormalUser = true;
    description = "fre3d0m";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  services.displayManager.sddm = {
    enable = false;
    wayland.enable = true;
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd sway";
        user = "fre3d0m";
      };
    };
  };

  services.desktopManager.plasma6.enable = false;

}
