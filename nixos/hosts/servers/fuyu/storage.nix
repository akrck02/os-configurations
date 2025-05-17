# Slimbook executive 16 custom configuration
{ pkgs, lib, config, inputs, home-manager, ...} : {

	fileSystems."/" ={
	 	device = "/dev/disk/by-uuid/c54b964c-ce55-4e1e-9ba0-730c8fe05b7b";
      fsType = "ext4";
  };

  fileSystems."/boot" = {
  	device = "/dev/disk/by-uuid/E3F9-283D";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };


  fileSystems."/media/services" = {
  	device = "/dev/disk/by-uuid/159b1095-bd53-45e7-9701-5cabfa4908c5";
    fsType = "ext4";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  fileSystems."/media/backup" = {
  	device = "/dev/disk/by-uuid/44c7a18b-3c9a-49f5-a800-85a329490a7a";
    fsType = "ext4";
    options = [ "fmask=0077" "dmask=0077" ];
  };


}
