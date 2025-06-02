{ pkgs, inputs, ... }:
{

  ## Modules to import
  imports = [
    ../modules/nixos/languages/english-es.nix
    ../modules/nixos/cli/cli.nix
    ../modules/nixos/networking/networking.nix
    ../modules/nixos/containers/docker.nix
    ../modules/nixos/development/language.servers.nix

    # services
    ../modules/nixos/services/homepage/homepage.nix
    ../modules/nixos/services/metrics/server-metrics.nix
    ../modules/nixos/services/metrics/kuma.nix
    # ../modules/nixos/services/cloud/nextcloud.nix


    # containers
    ../modules/containers/portainer.nix
    ../modules/containers/dockercraft.nix
  ];

  ## Configuration
  config = {

    home-manager.useGlobalPkgs = true;
    home-manager.extraSpecialArgs = { inherit inputs; };
    home-manager.backupFileExtension = "back";

    # Admin user
    users.users.fuyu = {
      isNormalUser = true;
      home = "/home/fuyu";
      initialPassword = "12345";
      description = "Admin user for fuyu server";
      shell = pkgs.zsh;
      createHome = true;
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
      ];
      openssh.authorizedKeys.keys = [ ];
    };
    home-manager.users.fuyu = import ../users/fuyu.nix;

    # Networking
    networking.firewall = {
      allowedTCPPorts = [
      	80
       	443
        25575
      ];
      checkReversePath = "loose";
      trustedInterfaces = [ "enp1s0" ];
    };

    ## Nginx reverse proxy

    # security.acme = {
    # 	acceptTerms = true;
    # 	certs.defaults.email = "akrck02@gmail.com";
    # };

    services.nginx = {
      enable = true;

      # other Nginx options
      virtualHosts = {
       	localhost = {
	        locations."/" = {
	          proxyPass = "http://127.0.0.1:8082";
	          proxyWebsockets = true; # needed if you need to use WebSocket
	          extraConfig = "proxy_ssl_server_name on;" + # required when the target is also TLS server with multiple hosts
	           "proxy_pass_header Authorization;";  # required when the server wants to use HTTP Authentication
	        };
					locations."/grafana/" = {
		        proxyPass = "http://127.0.0.1:3000";
		        proxyWebsockets = true; # needed if you need to use WebSocket
						recommendedProxySettings = true;
          	extraConfig = "proxy_ssl_server_name on;" + # required when the target is also TLS server with multiple hosts
            "proxy_pass_header Authorization;";  # required when the server wants to use HTTP Authentication
		      };
					locations."/nextcloud/" = {
					  proxyPass = "http://127.0.0.1:8009";
					  proxyWebsockets = true; # needed if you need to use WebSocket
						extraConfig = "proxy_ssl_server_name on;" + # required when the target is also TLS server with multiple hosts
						"proxy_pass_header Authorization;";  # required when the server wants to use HTTP Authentication
			    };
					locations."/uptime-kuma/" = {
					  proxyPass = "http://127.0.0.1:3001";
					  proxyWebsockets = true; # needed if you need to use WebSocket
			    };
	      };
      };
    };

    ## Nextcloud
    services.nextcloud = {
      hostName = "192.168.50.2";
      config = {
        adminuser = "admin";
        adminpassFile = "/etc/nixos/nextcloud-password.txt";
        extraTrustedDomains = [
          "192.168.50.2"
          "fuyu"
        ];
      };
    };

    services.postgresqlBackup = {
      location = "/media/backup/services/nextcloud/database";
      # time to start backup in systemd.time format
      startAt = "*-*-* 23:15:00";
    };

    ## Grafana
    services.grafana.settings = {
    	server = {
     		root_url = "http://fuyu/grafana/";
     		serve_from_sub_path = true;
     	};
    };
  };
}
