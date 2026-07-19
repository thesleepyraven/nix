{ pkgs, ... }:
{
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  programs.hyprland = {
    enable = true;
  };
  programs.nm-applet.enable = true;
  services.blueman.enable = true;
  services.power-profiles-daemon.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
  };
  environment.systemPackages = with pkgs; [
    kdePackages.dolphin
    kdePackages.discover
    networkmanagerapplet
    noctalia-shell
    pavucontrol
    swaybg
    swayidle
    swaylock
  ];
}
