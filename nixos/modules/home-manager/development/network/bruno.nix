{ pkgs, ...} : {
  config = {
    home.packages = with pkgs; [
      bruno
    ];
  };
}
