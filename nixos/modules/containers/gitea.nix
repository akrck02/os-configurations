{ config, pkgs, ... }:

{

  # Gitea
  virtualisation.oci-containers = {
  	backend = "docker";
	  containers = {
	   	"gitea" = {
		    autoStart = true;
		    image = "docker.io/gitea/gitea:latest";
		    environment = {
		      USER_UID = "1000";
		      USER_GID = "1000";
		    };
		    volumes = [
		      "/media/services/development/gitea:/data"
		      "/etc/timezone:/etc/timezone:ro"
		      "/etc/localtime:/etc/localtime:ro"
		    ];
		    ports = [
		      "0.0.0.0:3000:3000"
		      "0.0.0.0.0:222:22"
		    ];
		  };
	  };
  };
}
