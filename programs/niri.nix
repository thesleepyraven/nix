{ pkgs, ... }:
{
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
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
    fuzzel
    kdePackages.dolphin
    kdePackages.discover
    noctalia-shell
    pavucontrol
    swaybg
    swayidle
    swaylock
  ];
}
