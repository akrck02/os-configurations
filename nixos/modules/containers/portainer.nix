 { config, pkgs, ... }:
 {
   config.virtualisation.oci-containers.containers = {
     portainer = {
       image = "docker.io/portainer/portainer-ce:2.29.2-alpine";
       ports = [
       	"127.0.0.1:9000:9000"
        "127.0.0.1:9443:9443"
        "127.0.0.1:8000:8000"
       ];
       volumes = [
         "/root/portainer:/data"
       ];
       cmd = [];
     };
   };
 }
