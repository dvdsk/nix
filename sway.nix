{ pkgs, ... }:

  let 
  	menu = pkgs.writeShellApplication {
		name = "launch-app";
		runtimeInputs = [pkgs.kickoff pkgs.kickoff-dot-desktop];
		text = builtins.readFile ./bin_nix/launch-app.sh;
	};
	mod = "Mod4";
  in {
	  wayland.windowManager.sway = { 
		enable = true;
		systemd = {
		  xdgAutostart = true;
		  variables = [ "--all" ]; # TODO: check if importing PATH for xdg-desktop-portal is working
		};
		extraConfigEarly = "include ~/.config/sway/config";
		config = null;
		# config = {
		# 	modifier = mod; # windows/super key
		# 	terminal = "alacritty";
		# 	menu = "${menu}";
		#
		# 	# not everything can be set in config above
		# 	  keybindings = {
		# 		 "${mod}+1" = "workspace 1";
		# 		 "${mod}+2" = "workspace 2";
		# 		 "${mod}+3" = "workspace 3";
		# 		 "${mod}+4" = "workspace 4";
		# 		 "${mod}+5" = "workspace 5";
		#
		# 		 "${mod}+1" = "move container to workspace 1";
		# 		 "${mod}+2" = "move container to workspace 2";
		# 		 "${mod}+3" = "move container to workspace 3";
		# 		 "${mod}+4" = "move container to workspace 4";
		# 		 "${mod}+5" = "move container to workspace 5";
		#
		# 		 "${mod}+n" = "focus left";
		# 		 "${mod}+e" = "focus right";
		# 		 "${mod}+i" = "focus up";
		# 		 "${mod}+o" = "focus down";
		#
		# 		 "${mod}+Left" = "move left";
		# 		 "${mod}+Down" = "move down";
		# 		 "${mod}+Up" = "move up";
		# 		 "${mod}+Right" = "move right";
		# 	 };
		# };
		# startup = [
		# 	{command = "break-enforcer";}
		# ];
		# extraSessionCommands = ''
		#   export NIXOS_OZONE_WL=1
		# '';
		# extraConfigEarly = "include ~/.config/sway/common_config";
		# config = null;
		# package = pkgs.swayfx;
	  };


	  programs = {
		waybar = {
		  enable = true; systemd.enable = true;
		  # style = ''@import "common.css";'';
		};
		# swaylock = { enable = true;
		#   package = if inputs ? osConfig then pkgs.swaylock else pkgs.hello;
		#   settings = {
		#     daemonize = true; scaling = "fill"; image = "~/images/lockscreen";
		#     ignore-empty-password = true; show-failed-attempts = true;
		#     inside-color = lib.mkForce "1e1e2eaa";
		#   };
		# };
	  };
  }

# # users.yara = {
# #     home.pointerCursor = {
# #       name = "Adwaita";
# #       package = pkgs.adwaita-icon-theme;
# #       size = 24;
# #       x11 = {
# #         enable = true;
# #         defaultCursor = "Adwaita";
# #       };
# # 	  sway.enable = true;
# #     };
# # };
#
