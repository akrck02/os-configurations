# nitch install
{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    nitch
    fastfetch
  ];
}
