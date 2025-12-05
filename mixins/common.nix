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
	}
}
