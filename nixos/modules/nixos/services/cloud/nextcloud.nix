{ lib, pkgs, ... }:
{

	environment.etc."nextcloud-admin-pass".text = "PWD";
	services.nextcloud = {
	  enable = true;
	  package = pkgs.nextcloud31;
	  hostName = "localhost";
	  config.adminpassFile = "/etc/nextcloud-admin-pass";
	  config.dbtype = "sqlite";
	};

  #services = {

    ## Nextcloud
  #  nextcloud = {
  #    enable = true;
  #    package = pkgs.nextcloud31;
  #    autoUpdateApps.enable = true;
  #    config = {
  #      dbtype = "pgsql";
  #      dbuser = "nextcloud";
  #      dbhost = "/run/postgresql"; # nextcloud will add /.s.PGSQL.5432 by itself
  #      dbname = "nextcloud";

  #      trustedProxies = [
  #        "localhost"
  #        "127.0.0.1"
  #      ];
  #      extraTrustedDomains = [ ];
  #    };

      # specify only if you want redis caching
  #    extraOptions = {};
  #  };

    ## PostgreSQL
  #  postgresql = {
  #    enable = true;
  #    ensureDatabases = [ "nextcloud" ];
  #  };

    # optional backup for postgresql db
  #  postgresqlBackup = {
  #    enable = true;
  #    databases = [ "nextcloud" ];
  #  };
  #};

  #systemd.services.postgresql.postStart = lib.mkAfter ''
  #  $PSQL mydb -tAc 'GRANT ALL ON ALL TABLES IN SCHEMA public TO nextcloud' || true
  #  $PSQL mydb -tAc 'GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO nextcloud' || true
  #'';

  # ensure that postgres is running *before* running the setup
  #systemd.services."nextcloud-setup" = {
  #  requires = [ "postgresql.service" ];
  #  after = [ "postgresql.service" ];
  #};


}
