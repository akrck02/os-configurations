{ pkgs, ...} : {
  config = {
    home.packages = with pkgs; [
      typescript
    ];
  };
}
