{ pkgs, lib, inputs, config, myOverlays, ... }: {
	environment.systemPackages = with pkgs; [
		zoxide
		git
		exa
		bat
		htop
		btop
		ripgrep
		neomutt
		fd
		pass
		neovim
		killall

		curl
		wget
		efibootmgr

		rmpc

		nix-output-monitor
	];
}
