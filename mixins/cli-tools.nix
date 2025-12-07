{ pkgs, lib, inputs, config, myOverlays, ... }: {
	environment.systemPackages = with pkgs; [
		zoxide
		git
		eza
		bat
		htop
		btop
		ripgrep
		neomutt
		fd
		hyperfine
		tokei

		pass
		gnupg
		pinentry-tty

		neovim
		killall
		fish
		zsh
		bash

		curl
		wget
		efibootmgr

		rmpc

		nix-output-monitor
	];

	services.pcscd.enable = true;
	programs.gnupg.agent = {
		enable = true;
		# pinentryPackage = pkgs.pinentry-tty;
	};
}
