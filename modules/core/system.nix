{ pkgs, ... }:
{
    nix = {
        settings = {
            experimental-features = [
                "nix-command"
                "flakes"
            ];
        };
    };

    time.timeZone = "America/Toronto";
    i18n.defaultLocale = "en_CA.UTF-8";
    nixpkgs.config.allowUnfree = true;
    system.stateVersion = "26.05";
}
