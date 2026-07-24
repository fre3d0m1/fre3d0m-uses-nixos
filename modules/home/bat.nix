{ pkgs, ... }:
{
  home.file.".config/bat/config".text = ''
	--theme="Nord"
	--style="numbers,changes,grid"
	--paging=auto
  '';

  home.packages = with pkgs; [
	  bat
  ];
}
