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
      nixfmt
      lua-language-server
      ripgrep
    ];

    plugins = with pkgs.vimPlugins; [
      (nvim-treesitter.withPlugins (p: [
        p.tree-sitter-nix
        p.tree-sitter-vim
        p.tree-sitter-python
        p.tree-sitter-rust
        p.tree-sitter-lua
        p.tree-sitter-gdscript
        p.tree-sitter-gdshader
        p.tree-sitter-godot-resource
        p.tree-sitter-bash
      ]))
    ];
  };
}
