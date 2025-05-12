{ pkgs, lib, config, ...} : {
  config = {
    environment.systemPackages = with pkgs;  [
    	resources
    ];
  };
}
