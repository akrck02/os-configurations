# Slimbook executive 16 custom configuration
{ pkgs, lib, config, inputs, home-manager, ...} : {


  fileSystems."/media/backup" = {
  	device = "/dev/disk/by-uuid/159b1095-bd53-45e7-9701-5cabfa4908c5";
    fsType = "ext4";
  };

  fileSystems."/media/services" = {
  	device = "/dev/disk/by-uuid/44c7a18b-3c9a-49f5-a800-85a329490a7a";
    fsType = "ext4";
  };


}
