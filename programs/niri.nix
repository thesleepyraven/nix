{ pkgs, ... }:
{
  programs.niri = {
    enable = true;
    useNautilus = true;
  };
  programs.nm-applet.enable = true;
  programs.xwayland = {
    enable = true;
    package = pkgs.xwayland-satellite;
  };
  services.blueman.enable = true;
  services.power-profiles-daemon.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };
  environment.systemPackages = with pkgs; [
    kdePackages.dolphin
    kdePackages.discover
    fuzzel
    networkmanagerapplet
    noctalia-shell
    pavucontrol
    swaybg
    swayidle
    swaylock
  ];
}
