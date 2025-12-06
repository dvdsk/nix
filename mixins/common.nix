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
		discord

		alacritty
		alacritty-theme

		git
		neovim
		btop

		zed-editor
		pass
		killall
		bat
		nix-output-monitor

		curl
		wget
		ripgrep
		fd
		zoxide
		efibootmgr
	];

  nixpkgs = { overlays = myOverlays; config.allowUnfree = true; };
}
