{ config, pkgs, ... }:
{
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
