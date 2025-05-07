{ pkgs, ...} : {
  config = {
    home.packages = with pkgs; [
      jdk17
    ];
  };
}
