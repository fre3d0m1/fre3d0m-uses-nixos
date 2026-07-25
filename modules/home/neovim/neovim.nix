{ pkgs, ... }:
{
		
	  programs.neovim = {
		enable = true;

		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;

		initLua = ''
			${builtins.readFile ./init.lua}
		'';
		
		extraPackages = with pkgs; [
			stylua
			ruff
			black
			pyright
			nil
			lua-language-server
			ripgrep
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
}
