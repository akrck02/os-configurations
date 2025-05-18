# wget install
{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    wget
  ];
}
