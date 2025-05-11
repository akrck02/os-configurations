{ pkgs, ...} : {
  config = {
    home.packages = with pkgs; [
      python313
    ];
  };
}
