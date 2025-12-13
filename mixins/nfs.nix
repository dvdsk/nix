# some info https://github.com/NixOS/nixpkgs/issues/72722

{ pkgs, lib, inputs, config, myOverlays, ... }: 

{
	security.krb5 = {
		enable = true;
		settings = {
			libdefaults = {
				default_realm = "YGGDRASIL";
				dns_lookup_realm = "false";
				dns_lookup_kdc = "false";
			};
			domain_realm = { 
				"yggdrasil" = "YGGDRASIL";
			};
			realms = {
				"YGGDRASIL" = {
					admin_server = "asgard";
					kdc = "asgard";
				};
			};
		};
	};

	services.nfs.idmapd.settings = {
		General = {
			Verbosity = "0";
			Domain = "yggdrasil";
		};
		Mapping = {
			Nobody-User = "nobody";
			Nobody-Group = "nogroup";
		};
		Translation = {
			Method = lib.mkForce "static";
			GSS-method = lib.mkForce "static";
		};
		Static = { # TODO automate this bit?
			"yara-work@YGGDRASIL" = "yara";
		};
	};

	fileSystems."/home/yara/Music" = {
		device = "asgard:/srv/music";
		fsType = "nfs4";
	};

	environment.systemPackages = with pkgs; [
		kstart
	];

	# systemd.user.services.kerberos_mount = {
	# 	enable = true;
	# 	description = "Initializes, caches and renews Kerberos tickets";
	# 	after = [ "default.target" ];
	# 	wantedBy = [ "default.target" ];
	#
	# 	serviceConfig = {
	# 		Type = "exec";
	# 		RemainAfterExit = "yes";
	# 		ExecStart = ''${pkgs.kstart}/bin/k5start \
	# 			# run in daemon mode, recheck ticket every  30 minutes \
	# 			-K 30 \
	# 			# authenticate using keytab rather then asking for a password \
	# 			-f %h/.local/keytab \
	# 			# store this file as ticket cache \
	# 			-k /tmp/krb5cc_%U \
	# 			# principle to get tickets for \
	# 			%u'';
	# 	};
	# };

	# TODO cache and store (agenix?) and move into place on rebuild
	# sudo kadmin -p yara/admin -q "addprinc -randkey nfs/<host>" 
	# sudo kadmin -p yara/admin -q "ktadd nfs/<host>" 
	# sudo kadmin -p yara/admin -q "addprinc <local username>" 
	# sudo kadmin -p yara/admin -q "ktadd <local username>" 
}
