{ config, ... }:
let
  mkSymlink = path: config.lib.file.mkOutOfStoreSymlink path;
in
{
  home.stateVersion = "26.11";

  imports = [ ./venky/zed.nix ];

  xdg.configFile."niri".source = mkSymlink ./configs/niri;
  xdg.configFile."nvim".source = mkSymlink ./configs/nvim;
  xdg.configFile."kitty".source = mkSymlink ./configs/kitty;
}
