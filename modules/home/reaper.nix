{ pkgs, ... }:
{
  home.packages = [
    (pkgs.symlinkJoin {
      name = "reaper-wrapped";
      paths = [ pkgs.reaper ];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/reaper \
          --prefix LD_LIBRARY_PATH : "/run/current-system/sw/share/nix-ld/lib"
      '';
    })
  ];
}
