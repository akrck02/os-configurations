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
      favicon = "https://jnsgr.uk/favicon.ico";
      background = "https://raw.githubusercontent.com/akrck02/os-configurations/refs/heads/main/nixos/dotfiles/wallpapers/development.jpg";
      headerStyle = "clean";
      layout = {
        Development = { style = "column"; rows = 1; };
        Media = { style = "column"; rows = 1; };
      };
		};

	  bookmarks = [];

	  services = [
			{
				Media = [{
					Jellyfin = {
						href = "0.0.0.0:8080";
						description = "Local media streaming service.";
					};
				}];
			}
			{
				Development = [{
					Gitea = {
						href = "0.0.0.0:8081";
						description = "Git repository manager.";
					};
					Reposilite = {
						href = "0.0.0.0:8081";
						description = "Java/Kotlin artifact manager.";
					};
				}];
			}
		}];

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
