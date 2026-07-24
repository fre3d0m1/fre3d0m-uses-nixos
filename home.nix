{ config, pkgs, ... }:

{
  home.username = "fre3d0m";
  home.homeDirectory = "/home/fre3d0m";
  home.stateVersion = "26.11";

  programs.bash = {
	enable = true;
	shellAliases = {
		btw = "echo i use nixos btw";
		nrs = "sudo nixos-rebuild switch";
		nfis = "sudo nixos-rebuild switch --flake . --impure";
	};

	initExtra = ''
	   export PS1='\[\e[38;5;26m\]\u\[\e[0m\] in \[\e[38;5;38m\]\w\[\e[0m\] \\$ '
	'';
  };
  home.file.".config/hypr".source = ./config/hypr;
  home.file.".config/waybar".source = ./config/waybar;

  programs.alacritty = {
	enable = true;
	settings = {
		window.opacity = 0.9;
		font.normal = {
			family = "Fira Code";
			style = "Regular";
		};
	};
  };
  
  programs.gh = {
	enable = true;
	gitCredentialHelper = {
		enable = true;
	};
  };

  programs.neovim = {
	enable = true;

	viAlias = true;
	vimAlias = true;
	vimdiffAlias = true;

	extraLuaConfig = ''
		${builtins.readFile ./nvim/init.lua}
	'';
	
	extraPackages = with pkgs; [
		stylua
		ruff
		black
		pyright
		nil
	];

	plugins = with pkgs.vimPlugins; [
		(nvim-treesitter.withPlugins (p: [
			p.nix
			p.vim
			p.python
			p.rust
			p.lua
			p.gdscript
			p.gdshader
			p.godot-resource
		]))
	];
  };
  

  programs.git = {
	enable = true;
  };

  services.swaync.enable = true;

  home.file.".config/bat/config".text = ''
	--theme="Nord"
	--style="numbers,changes,grid"
	--paging=auto
  '';

  home.packages = with pkgs; [
	bat
	heroic
	godot_4_7
  ];

  home.pointerCursor = {
	enable = true;
	name = "Qogir";
	package = pkgs.qogir-icon-theme;
	size = 24;
  };
}
