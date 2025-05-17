{ config, pkgs, ... }:
{

	networking.firewall = {
		enable=true;
	  allowedTCPPorts = [ 8082 ];
	};

  services.homepage-dashboard = {

	  enable = true;

	  settings = {
			title = "Homelab - Fuyu server.";
      favicon = "https://avatars.githubusercontent.com/u/43274508?v=4";
      logo = "https://avatars.githubusercontent.com/u/43274508?v=4";
      background = "https://raw.githubusercontent.com/akrck02/os-configurations/refs/heads/main/nixos/dotfiles/wallpapers/development.jpg";
      headerStyle = "clean";
      layout = {
        Development = { style = "column"; rows = 1; };
        Cloud = { style = "column"; rows = 1; };
        Network = { style = "column"; rows = 1; };
      };
		};

	  services = [
			{
				Development = [
					{
						Gitea = {
							href = "https://0.0.0.0:8082";
							description = "Git repository manager.";
							widget = {
                type = "gitea";
                url = "https://0.0.0.0:8082";
                key = "";
              };
						};
				 	}
				  {
						Reposilite = {
							href = "https://0.0.0.0:8082";
							description = "Java/Kotlin artifact manager.";
						};
					}
				];
			}
			{
				Cloud = [
					{
						Nextcloud = {
							href = "https://0.0.0.0:8082";
							description = "Self hosted cloud suite.";
						};
					}
					{
						Immich = {
							href = "https://0.0.0.0:8082";
							description = "Self hosted gallery.";
						};
					}
					{
						Jellyfin = {
							href = "https://0.0.0.0:8082";
							description = "Local media streaming service.";
						};
					}
					{
						Radarr = {
							href = "https://0.0.0.0:8082";
							description = "Movie collection manager.";
						};
					}
				];
			}
			{
				Network = [
					{
						Pihole = {
							href = "https://0.0.0.0:8082";
							description = "DNS resolver.";
						};
					}
					{
						"Uptime kuma" = {
							href = "https://0.0.0.0:8082";
							description = "Health check for services.";
						};
					}
					{
						tailscale = {
							href = "https://login.tailscale.com/admin/machines";
							description = "Private mesh VPN service.";
							widget = {
                type = "tailscale";
                deviceid = "";
                key = "";
              };
						};
					}
				];
			}
			{
				Games = [
					{
						Dockercraft = {
							href = "https://0.0.0.0:8082";
							description = "Minecraft server.";
							widget = {
								type = "minecraft";
								url = "udp://0.0.0.0:25565";
							};
						};
					}
				];
			}
			{
				System = [
					{
						Grafana = {
							href = "https://0.0.0.0:8082";
							description = "Stats dashboard.";
						};
					}
					{
						Syncthing = {
							href = "https://0.0.0.0:8082";
							description = "Sync service.";
						};
					}
				];
			}
		];

	  widgets = [
			{
				logo = {
       		icon = "https://avatars.githubusercontent.com/u/43274508?v=4";
       	};
			}
      {
      	resources = {
      		label = "system";
        	cpu = true;
         	memory = true;
          cputemp= true;
          tempmin= 0; # optional, minimum cpu temp
          tempmax= 100; # optional, maximum cpu temp
          uptime= true;
       	};
      }
      {
       	resources = {
        	label = "storage"; disk = [ "/" ];
        };
      }
		];

    bookmarks = [];


	  kubernetes = {

	  };

	  docker = {

	  };

	  customJS = "";
	  customCSS = "";
  };
}
