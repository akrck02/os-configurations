{ config, pkgs, ... }:
{

	networking.firewall = {
		enable=true;
	  allowedTCPPorts = [ 8082 ];
	};

  services.homepage-dashboard = {

	  enable = true;

	  settings = {

		};

	  bookmarks = [
			{
				dev = [{
					github = [{
						abbr = "GH";
						hrfe = "https://github.com/akrck02";
					}];
				}];
			}
		];

	  services = [{
			media = [{
				jellyfin = {
					href = "0.0.0.0:8080";
					description = "Local media streaming service.";
				};
			}];
			dev = [{
				gitea = {
					href = "0.0.0.0:8081";
					description = "Git repository management.";
				};
			}];
		}];

	  widgets = [

		];

	  kubernetes = {

	  };

	  docker = {

	  };

	  customJS = "";
	  customCSS = "";
  };
}
