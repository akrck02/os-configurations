{ pkgs, ... }:
{
  services.nextcloud = {
    enable = true;
    configureRedis = true;
    package = pkgs.nextcloud27;
    hostName = "nix-nextcloud";
    config = {
      dbtype = "pgsql";
      dbuser = "nextcloud";
      dbhost = "/run/postgresql"; # nextcloud will add /.s.PGSQL.5432 by itself
      dbname = "nextcloud";
      adminpassFile = "/etc/nixos/password.txt";
      adminuser = "root";
      trustedProxies = [
        "localhost"
        "127.0.0.1"
        "YOUR_TAILSCALE_IP"
        "YOUR_DOMAIN"
      ];
      extraTrustedDomains = [ "YOUR_DOMAIN" ];
      overwriteProtocol = "https";
    };
  };

  services.postgresql = {
    enable = true;
    ensureDatabases = [ "nextcloud" ];
    ensureUsers = [
      {
        name = "nextcloud";
        ensurePermissions."DATABASE nextcloud" = "ALL PRIVILEGES";
      }
    ];
  };

  # ensure that postgres is running *before* running the setup
  systemd.services."nextcloud-setup" = {
    requires = [ "postgresql.service" ];
    after = [ "postgresql.service" ];
  };

  services.nginx.virtualHosts."nix-nextcloud".listen = [
    {
      addr = "127.0.0.1";
      port = 8009;
    }
  ];

}
