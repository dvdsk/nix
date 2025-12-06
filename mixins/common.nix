{ pkgs, lib, inputs, config, myOverlays, home-manager, ... }: {

	users.users.yara.isNormalUser = true;
	users.defaultUserShell = pkgs.fish;

	programs = {
		fish.enable = true;
	};

	environment.systemPackages = with pkgs; [
		nix-output-monitor
	];

  nixpkgs = { overlays = myOverlays; config.allowUnfree = true; };
}
