{ pkgs, ... }:
{ 
    programs = {
        steam = {
            enable = true;
            gamescopeSession.enable = true;
            extraCompatPackages = [pkgs.proton-ge-bin ];
            remotePlay.openFirewall = true;
            dedicatedServer.openFirewall = true;
            localNetworkGameTransfers.openFirewall= true;
        };

        gamescope = {
            enable = true;
            capSysNice = true;
            args = [
                "--rt"
                "--expose-wayland"
            ];
        };
    };

    hardware.steam-hardware.enable = true;
}
