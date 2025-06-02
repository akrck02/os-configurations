 { config, pkgs, ... }:
 {

   virtualisation.oci-containers = {
   	backend = "docker";
   	containers = {
	     	duckdns = {
	       image = "lscr.io/linuxserver/duckdns:latest";
         environment = {
         	 SUBDOMAINS="akrck02,dockercraft,isopets";
         	 TOKEN="";
           UPDATE_IP="ipv4";
         };
	     };
	   };
   };
 }
