{ pkgs, ... }:
{
    home.packages = with pkgs; [
        vesktop
        weechat
    ];

    programs.screen.screenrc = ''
        multiuser on
        acladd fre3d0m # TODO: change to your local user
        term screen-256color
      '';
}
