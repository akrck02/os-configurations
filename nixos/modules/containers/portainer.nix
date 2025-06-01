 { config, pkgs, ... }:
 {
   virtualisation.oci-containers = {
   	backend = "docker";
   	containers = {
	     	portainer = {
	       image = "docker.io/portainer/portainer-ce:2.29.2-alpine";
	       ports = [
	       	"0.0.0.0:9000:9000"
	        "0.0.0.0:9443:9443"
	        "0.0.0.0:8000:8000"
	       ];
	       volumes = [
	         "/root/portainer:/data"
	       ];
	       cmd = [];
	     };
	   };
   };
 }
