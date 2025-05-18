# nitch install
{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    nixd
    gcc
  ];
}
