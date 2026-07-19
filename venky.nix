{ config, ... }:
let
  mkSymlink = path: config.lib.file.mkOutOfStoreSymlink path;
in
{
  home.stateVersion = "26.11";

  imports = [ ./venky/zed.nix ];

  xdg.configFile."hypr".source = mkSymlink ./configs/hypr;
  xdg.configFile."nvim".source = mkSymlink ./configs/nvim;
  xdg.configFile."kitty".source = mkSymlink ./configs/kitty;
}
