{ pkgs, lib, inputs, config, myOverlays, home-manager, ... }: {

	users.users.yara.isNormalUser = true;
	# home-manager.users.yara = { pkgs, ...}: {
	# 	home.packages = [ pkgs.atool pkgs.httpie ];
	# 	programs.bash.enable = true;
	#
	# 	home.stateVersion = "25.11";
	# };

	# users.users.yara = {
	# 	isNormalUser = true;
	# 	extraGroups = [ "yara" "wheel" ];
	# 	initialPassword = "changethis";
	# 	linger = true;
	# };
	# users.defaultUserShell = pkgs.fish;

	# programs = {
	# 	fish.enable = true;
	# };


	environment.systemPackages = with pkgs; [
		nix-output-monitor
	];

  nixpkgs = { overlays = myOverlays; config.allowUnfree = true; };
}
