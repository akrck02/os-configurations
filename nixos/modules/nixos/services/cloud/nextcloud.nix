{ lib, pkgs, ... }:
{

	environment.etc."nextcloud-admin-pass".text = "PWD";
	services.nextcloud = {
	  enable = true;
	  package = pkgs.nextcloud31;
	  config.dbtype = "sqlite";
	};

}
