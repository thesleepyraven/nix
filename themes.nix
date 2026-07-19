{ pkgs, ... }:
{
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";
    enable = true;
    enableReleaseChecks = true;
    image = ./wallpaper.jpg;
    opacity = {
      terminal = 0.7;
    };
    polarity = "dark";
  };
}
