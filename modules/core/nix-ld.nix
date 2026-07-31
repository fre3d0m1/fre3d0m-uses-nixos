{ pkgs, ... }:
{
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib
    zlib
    libpng
    libx11
    libXext
    libXrender
    libXcursor
    libXfixes
    libXi
    libXrandr
    libxcb
    libxcb
    libxcb-util
    libxcb-cursor
    libxcb-keysyms
    libxcb-render-util
    libxcb-wm
    libxkbcommon
    # Add these crucial ones for XWayland UI handling:
    libxau
    libxdmcp
    glib
    cairo
    pango
    fontconfig
    freetype
  ];
}
