
{ pkgs, lib, inputs, config, myOverlays, ... }: {
	environment.systemPackages = with pkgs; [
		grim # screenshot functionality
		slurp # screenshot functionality
		wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout

		tuigreet
	];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd sway";
        user = "greeter";
      };
    };
  };

  # enable sway window manager
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
}

