{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (python314.withPackages (ps: [
      ps.requests
    ]))
  ];
}
