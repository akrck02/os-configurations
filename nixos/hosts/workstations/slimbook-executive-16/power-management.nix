# Power management settings
{ config, lib, pkgs, inputs, ... }:

{
  config = {
    services.power-profiles-daemon.enable = false;
    powerManagement.enable = true;
  	services.thermald.enable = true;
  	services.tlp = {
         enable = true;
         settings = {
           CPU_SCALING_GOVERNOR_ON_AC = "performance";
           CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

           CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
           CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

           CPU_MIN_PERF_ON_AC = 0;
           CPU_MAX_PERF_ON_AC = 100;
           CPU_MIN_PERF_ON_BAT = 0;
           CPU_MAX_PERF_ON_BAT = 80;

          #Optional helps save long term battery health
          START_CHARGE_THRESH_BAT0 = 20; # 40 and below it starts to charge
          STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging

         };
   };

   services.auto-cpufreq.enable = true;
   services.auto-cpufreq.settings = {
     battery = {
        governor = "powersave";
        turbo = "never";
     };
     charger = {
        governor = "performance";
        turbo = "auto";
     };
   };
  };
}
