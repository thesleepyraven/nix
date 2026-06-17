{ config, ... }:
let
  mkSymlink = path: config.lib.file.mkOutOfStoreSymlink path;
in
{
  home.stateVersion = "26.11";

  xdg.configFile."nvim".source = mkSymlink ./configs/nvim;
  xdg.configFile."kitty".source = mkSymlink ./configs/kitty;
}
