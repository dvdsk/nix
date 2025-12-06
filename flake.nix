# nixos-rebuild build --flake .#Work
{
	inputs = { 
		nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
		rahul-config.url = "github:rrbutani/nix-config";
		flake-utils.url  = "github:numtide/flake-utils";
		nixgl.url        = "github:guibou/nixGL";
		ragenix.url      = "github:yaxitech/ragenix";
		nix-darwin.url   = "github:LnL7/nix-darwin/master";
	};

	outputs = { nix-darwin, ragenix, nixgl, flake-utils, rahul-config, nixpkgs, self,  ... } @ inputs:
	let
	  inherit (nixpkgs) lib;
	  listDir = rahul-config.lib.util.list-dir;

		myOverlays = [
		  self.overlays.default nixgl.overlays.default ragenix.overlays.default
		  # obs-gamepad.overlays.default (import ./overlays.nix inputs)
		];

	   special = system: {
		  # pkgs-stable = nixpkgs-stable.legacyPackages.${system};
		  inherit myOverlays inputs self;
		};

		machine = system: module: (lib.nixosSystem {
			system = system;
			modules = [ module ./mixins/common.nix ];
		});
	in {

		 nixosConfigurations = {
			 Work = machine "x86_64-linux" ./hosts/work/main.nix;
		 };

		overlays.default = final: _: listDir {
		  of = ./pkgs; mapFunc = _: p: final.callPackage p {};
		};

	} // (flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system}.extend self.overlays.default;
    in with lib; {
      packages = pipe ./pkgs [
        (dir: listDir { of = dir; mapFunc = p: _: pkgs.${p}; })
        (filterAttrs (_: meta.availableOn pkgs.stdenv.hostPlatform))
        (filterAttrs (_: p: !(p.meta.broken or false)))
      ];
    })
  );
}
