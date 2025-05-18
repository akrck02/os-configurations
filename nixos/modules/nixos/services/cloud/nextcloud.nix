{ ... }:
{
  services = {

    ## Nextcloud
    nextcloud = {
      enable = true;
      configureRedis = true;
      #hostName = "nix-nextcloud";
      autoUpdateApps.enable = true;
      config = {
        dbtype = "pgsql";
        dbuser = "nextcloud";
        dbhost = "/run/postgresql"; # nextcloud will add /.s.PGSQL.5432 by itself
        dbname = "nextcloud";

        trustedProxies = [
          "localhost"
          "127.0.0.1"
        ];
        extraTrustedDomains = [ ];
        overwriteProtocol = "https";
        https = true;
      };

      # specify only if you want redis caching
      extraOptions = {
        redis = {
          host = "127.0.0.1";
          port = 31638;
          dbindex = 0;
          timeout = 1.5;
        };
      };
    };

    ## PostgreSQL
    postgresql = {
      enable = true;
      ensureDatabases = [ "nextcloud" ];
      ensureUsers = [
        {
          name = "nextcloud";
          ensurePermissions."DATABASE nextcloud" = "ALL PRIVILEGES";
        }
      ];
    };

    # optional backup for postgresql db
    postgresqlBackup = {
      enable = true;
      location = "/data/backup/nextclouddb";
      databases = [ "nextcloud" ];
      # time to start backup in systemd.time format
      startAt = "*-*-* 23:15:00";
    };
  };

  # ensure that postgres is running *before* running the setup
  systemd.services."nextcloud-setup" = {
    requires = [ "postgresql.service" ];
    after = [ "postgresql.service" ];
  };

}
