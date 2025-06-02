 { config, pkgs, ... }:
 {

   virtualisation.oci-containers = {
   	backend = "docker";
   	containers = {
	     	reposilite = {
	       image = "ghcr.io/dzikoysk/reposilite:3.5.20";

				 ports = [
	       	"0.0.0.0:5555:8080"
	       ];

	       volumes = [
	         "/media/services/development/artifacts/reposilite:/data"
	       ];

         environment = {
         	 JAVA_OPTS="-Xmx128M";
           REPOSILITE_OPTS="--token admin:secret";
         };
	     };
	   };
   };
 }
