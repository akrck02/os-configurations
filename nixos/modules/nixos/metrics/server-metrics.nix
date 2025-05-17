{config, ...} : {

  services.grafana = {
      enable = true;

      settings = {
        server = {
          #domain = "grafana.pele";
          http_port = 2342;
          http_addr = "127.0.0.1";
          enforce_domain = true;
          enable_gzip = true;
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

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 2342 9002 ];
  };

}
