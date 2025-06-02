 { config, pkgs, ... }:
 {

   virtualisation.oci-containers = {
   	backend = "docker";
   	containers = {
	     	mewbot = {
	       image = "docker.io/akrck02/mewbot:latest";
         environment = {
         	 DISCORD_BOT_TOKEN="";
         };
	     };
	   };
   };
 }
