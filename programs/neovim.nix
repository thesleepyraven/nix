{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };
  environment.systemPackages = with pkgs; [
    fzf
    kdlfmt
    luajitPackages.lua-lsp
    nil
    nixfmt
    ripgrep
  ];
}
