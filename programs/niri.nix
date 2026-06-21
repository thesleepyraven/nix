{ pkgs, ... }:
{
  programs.dms-shell = {
    enable = true;
    enableClipboardPaste = true;
    enableDynamicTheming = true;
    enableSystemMonitoring = true;
    enableVPN = true;
    plugins = { };
  };
  programs.niri = {
    enable = true;
    useNautilus = true;
  };
  programs.nm-applet.enable = true;
  programs.xwayland.enable = true;
  services.blueman.enable = true;
  services.power-profiles-daemon.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gnome ];
  };
  environment.systemPackages = with pkgs; [
    kdePackages.dolphin
    fuzzel
    nautilus
    noctalia-shell
    networkmanagerapplet
    pavucontrol
    swaybg
    swayidle
    swaylock
    xwayland-satellite
  ];
}
