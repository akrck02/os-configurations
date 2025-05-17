{config, ...} : {

  services.grafana = {
      enable = true;

      settings = {
        server = {
          http_port = 3000;
          http_addr = "0.0.0.0";
          enforce_domain = false;
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
    allowedTCPPorts = [ 3000 9002 ];
  };

}
