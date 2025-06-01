{ lib, pkgs, ... }:
{

	environment.etc."nextcloud-admin-pass".text = "PWD";
	services.nextcloud = {
	  enable = true;
	  package = pkgs.nextcloud31;
	  config.adminpassFile = "/etc/nextcloud-admin-pass";
	  config.dbtype = "sqlite";
	};

}
