{ pkgs, lib, inputs, config, myOverlays, ... }: {
	users.users.yara = {
		isNormalUser = true;
		extraGroups = [ "yara" "wheel" ];
		initialPassword = "changethis";
		linger = true;
	};
	users.defaultUserShell = pkgs.fish;

	programs = {
		fish.enable = true;
	};


	environment.systemPackages = with pkgs; [
		discord-ptb

		alacritty
		alacritty-theme

		git
		neovim
		btop

		kickoff
		zed-editor
		pass
		killall
		bat
		nix-output-monitor

		tuigreet
		curl
		wget
		ripgrep
		fd
		slack
		zoxide
		efibootmgr
	];
}
