{config, ...} : {

  services.grafana = {
      enable = true;

      settings = {
        server = {
          #domain = "grafana.pele";
          http_port = 2342;
          http_addr = "127.0.0.1";
        };
      };
  };

  services.prometheus = {
    exporters = {
      node = {
        enable = true;
        enabledCollectors = [ "systemd" ];
        port = 9002;
      };
    };

    scrapeConfigs = [
      {
        job_name = "chrysalis";
        static_configs = [{
          targets = [ "127.0.0.1:${toString config.services.prometheus.exporters.node.port}" ];
        }];
      }
    ];
  };

  services.nginx.virtualHosts."fuyu.local" = {
    addSSL = true;
    enableACME = true;
    locations."/grafana/" = {
        proxyPass = "http://${toString config.services.grafana.settings.server.http_addr}:${toString config.services.grafana.settings.server.http_port}";
        proxyWebsockets = true;
        recommendedProxySettings = true;
    };
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 2342 9002 ];
  };

}
