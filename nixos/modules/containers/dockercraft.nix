 { config, pkgs, ... }:
 {
   virtualisation.oci-containers = {
   	backend = "docker";
   	containers = {
	     	dockercraft = {
	       image = "docker.io/itzg/minecraft-server";

				 ports = [
	       	"0.0.0.0:25575:25565"
	       ];

	       volumes = [
	         "/media/services/minecraft/dockercraft:/data"
	       ];

         environment = {
	         VERSION = "1.21.3";
	         SERVER_NAME = "Dockercraft v2.0";
	         MOTD = "Minecraft server, now with more backups!";
	         TYPE = "PAPER";
	         EULA = "true";
	         DIFFICULTY = "normal";
	         ICON = "https://avatars.githubusercontent.com/u/43274508?v=4";
	         MAX_PLAYERS = "30";
	         ENABLE_COMMAND_BLOCK = "true";
	         SPAWN_PROTECTION = "0";
	         VIEW_DISTANCE = "20";
	         ENABLE_WHITELIST = "true";
	         AUTO_PAUSE = "true";
	         MAX_MEMORY = "8G";
	         INIT_MEMORY = "512m";
	         EXEC_DIRECTLY = "true";
         };
         # restart = "unless-stopped";
	     };
	   };
   };
 }
