{ pkgs, ...}:
{
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib
    zlib
    gnumake # Needed if telescope-fzf-native tries to run `make`
  ];
}
