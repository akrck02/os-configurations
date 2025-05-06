{ pkgs, lib, config, ...} : {
  config = {
    virtualisation.docker.enable = true;
  };
}
