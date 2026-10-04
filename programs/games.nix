{ pkgs, ... }: {
  environment.sessionVariables.PROTON_ENABLE_WAYLAND = "1";
  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [
    heroic
  ];
}
