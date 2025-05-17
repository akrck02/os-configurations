{ config, pkgs, ... }:
{
  virtualisation.oci-containers = {
    backend = "docker";
    containers = {
      Homepage = {
        autoStart = true;
        image = "ghcr.io/gethomepage/homepage:latest";
        extraOptions = [ "--net=host" ];
        ports = [
          "3000:3000"
        ];
        volumes = [
          "/home/fuyu/.dotfiles/Homepage-startpage/config:/app/config"
          "/home/fuyu/.dotfiles/Homepage-startpage/Graphics/icons:/app/public/icons"
        ];
      };
    };
  };
}
