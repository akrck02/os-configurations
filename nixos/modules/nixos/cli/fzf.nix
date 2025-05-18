# fzf install
{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    fzf
  ];
  # programs.fzf.enable = true;
}
