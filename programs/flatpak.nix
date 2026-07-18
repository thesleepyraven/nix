{ ... }:
let
  nix-flatpak = builtins.fetchGit {
    url = "https://github.com/gmodena/nix-flatpak.git";
    ref = "refs/tags/latest";
  };
in
{
  imports = [ "${nix-flatpak}/modules/nixos.nix" ];
  services.flatpak = {
    enable = true;
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];
    packages = [
      {
        appId = "app.zen_browser.zen";
        origin = "flathub";
      }
      {
        appId = "com.discordapp.Discord";
        origin = "flathub";
      }
    ];
    update.auto = {
      enable = true;
      onCalendar = "daily";
    };
    uninstallUnmanaged = true;
  };
}
