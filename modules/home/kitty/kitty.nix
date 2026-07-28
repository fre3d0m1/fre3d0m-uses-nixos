{ pkgs, ... }:
{
    programs.kitty = {
        enable = true;

        extraConfig = ''
            ${builtins.readFile ./mocha.conf}
        '';
    };
}
