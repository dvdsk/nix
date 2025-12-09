{ pkgs, lib, inputs, config, myOverlays, ... }: {
	environment.systemPackages = with pkgs; [
		kodi
		freetube
		steam
	];
}
