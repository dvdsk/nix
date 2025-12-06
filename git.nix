{ pkgs, ... }: {

  programs = {
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
    };

	  git = {
		enable = true;
		settings = {
			user.name = "Yara";
			user.email = "git@yara.blue";
		};
		# signing = { #soon tm 
		#   key = "git@yara.blue";
		#   signByDefault = false;
		# };
	  };

	 fish = {
	   enable = true;
	   shellAbbrs = {
		 # Git abbreviations
		 "gau" = "git add --update";
		 "gcmsg" = "git commit -am";
		 "gcob" = "git checkout -b";
		 "gd" = "git diff";
		 "gst" = "git status";
		 "gp" = "git push";
	   };
	 };
	# # soon
    # jujutsu = {
    #   enable = true;
    # };
  };
}
