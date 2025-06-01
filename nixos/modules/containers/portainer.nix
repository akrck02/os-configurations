 { config, pkgs, ... }:
 {
	 networking.firewall = {
	   allowedTCPPorts = [ 8000 9443 9000 ];
	   checkReversePath = "loose";
	   trustedInterfaces = [ "enp1s0" ];
	 };

   virtualisation.oci-containers.containers = {
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
