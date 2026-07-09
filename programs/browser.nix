{ pkgs, ... }: {
  programs.chromium = {
    enable = true;
    extensions = [
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
      "pkehgijcmpdhfbdbbnkijodmdjhbjlgp" # Privacy Badger
      "ddkjiahejlhfcafbddmgiahcphecmpfh" # uBlock Origin Lite
      "hkgfoiooedgoejojocmhlaklaeopbecg" # PiP by Google
    ];
  };
  programs.firefox = {
    enable = true;
    policies = {
      DisableAccounts = true;
      DisableFirefoxAccounts = true;
      DisableFirefoxStudies = true;
      DisableTelemetry = true;
      DisplayBookmarksToolbar = "always";
      DontCheckDefaultBrowser = true;
      EnableTrackingProtection = {
        Category = "strict";
        Cryptomining = true;
        EmailTracking = true;
        Fingerprinting = true;
        Locked = true;
        SuspectedFingerprinting = true;
        Value = true;
      };
      ExtensionSettings =
        with builtins;
        let
          extension = shortId: uuid: {
            name = uuid;
            value = {
              install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
              installation_mode = "force_installed";
              private_browsing = true;
            };
          };
        in
        listToAttrs [
          (extension "clearurls" "{74145f27-f039-47ce-a470-a662b129930a}")
          (extension "darkreader" "addon@darkreader.org")
          (extension "privacy-badger17" "jid1-MnnxcxisBPnSXQ@jetpack")
          (extension "ublock-origin" "uBlock0@raymondhill.net")
        ];
      ExtensionUpdate = true;
      GenerativeAI = {
        Enabled = false;
        Locked = true;
      };
      Homepage = {
        Locked = true;
        StartPage = "previous-session";
      };
      Permissions = {
        Autoplay = {
          Default = "allow-audio-video";
          Locked = true;
        };
      };
      PostQuantumKeyAgreementEnabled = true;
      PrivateBrowsingModeAvailability = 2;
      PromptForDownloadLocation = true;
      SanitizeOnShutdown = true;
      SearchEngines = {
        Default = "ddg";
        Add = [
          {
            Name = "nixpkgs packages";
            URLTemplate = "https://search.nixos.org/packages?query={searchTerms}";
            IconURL = "https://wiki.nixos.org/favicon.ico";
            Alias = "@np";
          }
          {
            Name = "NixOS options";
            URLTemplate = "https://search.nixos.org/options?query={searchTerms}";
            IconURL = "https://wiki.nixos.org/favicon.ico";
            Alias = "@no";
          }
          {
            Name = "NixOS Wiki";
            URLTemplate = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
            IconURL = "https://wiki.nixos.org/favicon.ico";
            Alias = "@nw";
          }
          {
            Name = "noogle";
            URLTemplate = "https://noogle.dev/q?term={searchTerms}";
            IconURL = "https://noogle.dev/favicon.ico";
            Alias = "@ng";
          }
        ];
      };
      SearchSuggestEnabled = true;
      ShowHomeButton = true;
      SkipTermsOfUse = true;
    };
  };
  environment.systemPackages = with pkgs; [
    chromium
    google-chrome
  ];
}
