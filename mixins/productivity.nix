{ pkgs, lib, inputs, config, myOverlays, ... }: {
	environment.systemPackages = with pkgs; [
		firefox
		alacritty
		alacritty-theme

		zed-editor # cant log in

		anki
		anki-widget

		audacity
		vlc
		nautilus

		# TODO move somewhere else?
		yubikey-manager
		cryptsetup
	];
}
