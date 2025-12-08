{ pkgs, lib, inputs, config, myOverlays, ... }: {
	environment.systemPackages = with pkgs; [
		firefox
		alacritty
		alacritty-theme
		zed-editor
		anki
		audacity
		vlc
		nautilus

		# TODO move somewhere else?
		yubikey-manager
		cryptsetup
	];
}
