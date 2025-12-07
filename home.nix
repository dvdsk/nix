{ inputs, config, pkgs, lib, ... }: {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "yara";
  home.homeDirectory = "/home/yara";

  home.packages = [
  	pkgs.fortune
  ];

  imports = [
  	./git.nix
	# ./sway.nix # decided to do this mutably
  ];

  home.pointerCursor = {
	  gtk.enable = true;
	  x11.enable = true;
	  name = "WhiteSur-cursors";
	  package = pkgs.whitesur-cursors;
	  size = 24;
  };

    home.sessionVariables = {
      NIX_PATH = "nixpkgs=flake:nixpkgs";
      NIX_CONF_DIR = lib.mkDefault (config.home.homeDirectory + "/nix");
    };

	home.file = builtins.listToAttrs (map (path:
	  let f = lib.strings.removePrefix (inputs.self + "/dotfiles/") (toString path);
	  in {
		name = f ; value = {source = config.lib.file.mkOutOfStoreSymlink
		  (config.home.sessionVariables.NIX_CONF_DIR + "/dotfiles/" + f);};
	  }) (lib.filesystem.listFilesRecursive ./dotfiles)); # dotfiles dir is in the same directory this file

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
