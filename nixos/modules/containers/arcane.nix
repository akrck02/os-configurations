 { config, pkgs, ... }:
 {
   virtualisation.oci-containers = {
   	backend = "docker";
   	containers = {
	     	arcane = {
	       image = "ghcr.io/getarcaneapp/arcane:latest";
	       ports = [
	       	"0.0.0.0:9000:3552"
	       ];
	       volumes = [
					 "/var/run/docker.sock:/var/run/docker.sock"
	         "/root/arcane/data:/app/data"
					 "/root/arcane/projects:/app/data/projects"
	       ];
					environment = [
		        "APP_URL=http://localhost:3552"
		        "PUID=1000"
		        "PGID=1000"
		        "ENCRYPTION_KEY=xxxxxxxxxxxxxxxxxxxxxx"
		        "JWT_SECRET=xxxxxxxxxxxxxxxxxxxxxxxxxx"
					]
	       cmd = [];
	     };
	   };
   };
 }
