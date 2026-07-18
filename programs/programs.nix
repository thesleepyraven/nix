{ pkgs, ... }:
{
  programs.appimage = {
    enable = true;
    binfmt = true;
  };
  programs.direnv.enable = true;
  programs.git = {
    enable = true;
    lfs.enable = true;
  };
  programs.localsend.enable = true;
  programs.nix-ld.enable = true;

  fonts.enableDefaultPackages = true;
  fonts.fontDir.enable = true;
  fonts.packages =
    with pkgs;
    [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      noto-fonts-emoji-blob-bin
      noto-fonts-monochrome-emoji
    ]
    ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

  environment.systemPackages = with pkgs; [
    comma
    gh
    mpv
    onlyoffice-desktopeditors
    quickemu
    sbctl
    unzip
    wget
    zip
  ];

}
