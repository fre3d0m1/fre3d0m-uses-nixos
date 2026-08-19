{ ... }:
{
  programs.bash = {
	enable = true;
	shellAliases = {
		btw = "echo i use nixos btw";
		nrs = "sudo nixos-rebuild switch";
		nfis = "sudo nixos-rebuild switch --flake .#desktop-fast";
		shut = "hyprshutdown -t 'Shutting down...' --post-cmd 'shutdown -P 0'";
		rest = "hyprshutdown -t 'Restarting...' --post-cmd 'reboot'";
	};

	initExtra = ''
	   export PS1='\[\e[38;5;26m\]\u\[\e[0m\] in \[\e[38;5;38m\]\w\[\e[0m\] \\$ '
	'';
  };
}
