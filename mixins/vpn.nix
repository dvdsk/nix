{ pkgs, lib, inputs, config, myOverlays, ... }: {

 	# docs at: https://wiki.nixos.org/wiki/WireGuard

	networking.wg-quick.interfaces = {
		vpn_nl = {
			autostart = false;
			address = ["10.2.0.2/32"];
			listenPort = 51820;
			dns = ["10.2.0.1"];
			privateKeyFile = "/root/secrets/vpn_nl";

			peers = [{ 
				publicKey = "QfedBwVdaqDpaGL+8e/Wx9M8O/ZlM6vt/CSACCYfgDE=";
				allowedIPs = ["0.0.0.0/0" "::/0"];
				endpoint = "169.150.196.65:51820"; # TODO in secret management
				persistentKeepalive = 25;
			}];
		};
	};

	# NixOS firewall will block wg traffic because of rpfilter
	networking.firewall.checkReversePath = "loose";
	networking.firewall.allowedUDPPorts = [config.networking.wg-quick.interfaces.vpn_nl.listenPort];

	# Exempt local network from tunnel
	systemd.network.networks.vpn_nl.routingPolicyRules = [
		{
		  To = "192.168.0.0/24";
		  Priority = 9;
		}
	  ];

	environment.systemPackages = with pkgs; [		
		wireguard-tools
	];
}
