{ ... }:
let
  comma = builtins.fetchGit {
    url = "https://github.com/nix-community/nix-index-database";
    ref = "main";
  };
in
{
  imports = [ "${comma}/nixos-module.nix" ];
  programs.nix-index-database.enable = true;
  programs.nix-index-database.comma.enable = true;
}
