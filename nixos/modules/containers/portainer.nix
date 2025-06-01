 { config, pkgs, ... }:
 {
	 networking.firewall = {
	   allowedTCPPorts = [ 8000 9443 9000 ];
	   checkReversePath = "loose";
	   trustedInterfaces = [ "enp1s0" ];
	 };

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
