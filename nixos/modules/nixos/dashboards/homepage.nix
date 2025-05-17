{ config, pkgs, ... }:
{

	networking.firewall = {
		enable=true;
	  allowedTCPPorts = [ 8082 ];
	};

  services.homepage-dashboard = {

	  enable = true;

	  settings = {
			title = "Fuyu homelab server.";
      favicon = "https://avatars.githubusercontent.com/u/43274508?v=4";
      background = "https://raw.githubusercontent.com/akrck02/os-configurations/refs/heads/main/nixos/dotfiles/wallpapers/development.jpg";
      headerStyle = "clean";
      layout = {
        Development = { style = "column"; rows = 1; };
        Cloud = { style = "column"; rows = 1; };
        Network = { style = "column"; rows = 1; };
      };
		};

	  bookmarks = [];

	  services = [
			{
				Development = [
					{
						Gitea = {
							href = "0.0.0.0:8082";
							description = "Git repository manager.";
						};
				 	}
				  {
						Reposilite = {
							href = "0.0.0.0:8082";
							description = "Java/Kotlin artifact manager.";
						};
					}
				];
			}
			{
				Cloud = [
					{
						Nextcloud = {
							href = "0.0.0.0:8082";
							description = "Self hosted cloud suite.";
						};
					}
					{
						Immich = {
							href = "0.0.0.0:8082";
							description = "Self hosted gallery.";
						};
					}
					{
						Jellyfin = {
							href = "0.0.0.0:8082";
							description = "Local media streaming service.";
						};
					}
					{
						Radarr = {
							href = "0.0.0.0:8082";
							description = "Movie collection manager.";
						};
					}
				];
			}
			{
				Network = [
					{
						Pihole = {
							href = "0.0.0.0:8082";
							description = "DNS resolver.";
						};
					}
					{
						"Uptime kuma" = {
							href = "0.0.0.0:8082";
							description = "Self hosted gallery.";
						};
					}
					{
						tailscale = {
							href = "0.0.0.0:8082";
							description = "Private mesh VPN service.";
						};
					}
				];
			}
			{
				Games = [
					{
						Dockercraft = {
							href = "0.0.0.0:8082";
							description = "Minecraft server.";
						};
					}
				];
			}
			{
				System = [
					{
						Grafana = {
							href = "0.0.0.0:8082";
							description = "Stats dashboard.";
						};
					}
					{
						Syncthing = {
							href = "0.0.0.0:8082";
							description = "Sync service.";
						};
					}
				];
			}
		];

	  widgets = [
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

	  kubernetes = {

	  };

	  docker = {

	  };

	  customJS = "";
	  customCSS = "";
  };
}
