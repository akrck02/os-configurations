{ config, ... }:
{
  services.uptime-kuma = {
  	enable = true;
   	settings = {
    	"UPTIME_KUMA_HOST" = "fuyu/uptime";
    };
  }
}
