{ ... }:
{

  services.homepage-dashboard = {

    enable = true;
    openFirewall = true;
    listenPort = 8082;

    settings = {
      title = "Homelab - Fuyu server.";
      favicon = "https://avatars.githubusercontent.com/u/43274508?v=4";
      logo = "https://avatars.githubusercontent.com/u/43274508?v=4";
      background = "https://raw.githubusercontent.com/akrck02/os-configurations/refs/heads/main/nixos/dotfiles/wallpapers/development.jpg";
      headerStyle = "clean";
      layout = {
        Development = {
          style = "column";
          rows = 1;
        };
        Cloud = {
          style = "column";
          rows = 1;
        };
        Network = {
          style = "column";
          rows = 1;
        };
      };
    };

    services = [
      {
        Development = [
          {
            Gitea = {
              href = "https://fuyu:8081";
              description = "Git repository manager.";
              widget = {
                type = "gitea";
                url = "https://fuyu:8082";
                key = "";
              };
            };
          }
          {
            Reposilite = {
              href = "https://fuyu/reposilite/";
              description = "Java/Kotlin artifact manager.";
            };
          }
        ];
      }
      {
        Cloud = [
          {
            Nextcloud = {
              href = "https://fuyu/nextcloud/";
              description = "Self hosted cloud suite.";
            };
          }
          {
            Immich = {
              href = "https://fuyu/immich/";
              description = "Self hosted gallery.";
            };
          }
          {
            Jellyfin = {
              href = "https://fuyu/jellyfin/";
              description = "Local media streaming service.";
            };
          }
          {
            Radarr = {
              href = "https://fuyu/radarr/";
              description = "Movie collection manager.";
            };
          }
        ];
      }
      {
        Network = [
          {
            tailscale = {
              href = "https://login.tailscale.com/admin/machines";
              description = "Private mesh VPN service.";
              widget = {
                type = "tailscale";
                deviceid = "0";
                key = "0";
              };
            };
          }
          {
            Pihole = {
              href = "https://fuyu/pihole/";
              description = "DNS resolver.";
            };
          }
          {
            "Uptime kuma" = {
              href = "https://fuyu/uptime/";
              description = "Health check for services.";
            };
          }
        ];
      }
      {
        Games = [
          {
            Dockercraft = {
              href = "https://fuyu/";
              description = "Minecraft server.";
              widget = {
                type = "minecraft";
                url = "udp://akrck02.duckdns.org:25575";
              };
            };
          }
        ];
      }
      {
        System = [
          {
            Grafana = {
              href = "https://fuyu/grafana/";
              description = "Stats dashboard.";
            };
          }
          {
            Portainer = {
              href = "https://fuyu/portainer/";
              description = "Container manager.";
              widget = {
                type = "portainer";
                url = "https://fuyu:9443";
                env = 1;
                key = "";
              };
            };
          }
          {
            Syncthing = {
              href = "https://fuyu/syncthing/";
              description = "Sync service.";
            };
          }
        ];
      }
    ];

    widgets = [
      {
        logo = {
          icon = "https://avatars.githubusercontent.com/u/43274508?v=4";
        };
      }
      {
        resources = {
          label = "system";
          cpu = true;
          memory = true;
          cputemp = true;
          tempmin = 0; # optional, minimum cpu temp
          tempmax = 100; # optional, maximum cpu temp
          uptime = true;
        };
      }
      {
        resources = {
          label = "storage";
          disk = [ "/" ];
        };
      }
      {
        resources = {
          label = "services";
          disk = [ "/media/services" ];
        };
  		}
    	{
        resources = {
          label = "backup";
          disk = [ "/media/backup" ];
        };
      }
    ];

    bookmarks = [ ];

    kubernetes = {

    };

    docker = {

    };

    customJS = "";
    customCSS = "";
  };
}
