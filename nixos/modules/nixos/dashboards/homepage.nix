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
        dev = { style = "column"; rows = 1; };
        media = { style = "column"; rows = 1; };
      };
		};

	  bookmarks = [
			{
				dev = [{
					github = [{
						abbr = "GH";
						href = "https://github.com/akrck02";
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
			{ search = { provider = "google"; target = "_blank"; }; }
      { resources = { label = "system"; cpu = true; memory = true; }; }
      { resources = { label = "storage"; disk = [ "/" ]; }; }
		];

	  kubernetes = {

	  };

	  docker = {

	  };

	  customJS = "";
	  customCSS = "";
  };
}
