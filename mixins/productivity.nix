{ pkgs, lib, inputs, config, myOverlays, ... }: {
	environment.systemPackages = with pkgs; [
		alacritty
		alacritty-theme
		zed-editor
		anki
		audacity
		vlc
	]
}
