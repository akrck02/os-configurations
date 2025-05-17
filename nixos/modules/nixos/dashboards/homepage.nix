{ config, pkgs, ... }:
{

	networking.firewall = {
		enable=true;
	  allowedTCPPorts = [ 8082 ];
	};

  services.homepage-dashboard = {

	  enable = true;

	  settings = {};

	  bookmarks = [];

	  services = [];

	  widgets = [];

	  kubernetes = { };

	  docker = { };

	  customJS = "";
	  customCSS = "";
  };
}
