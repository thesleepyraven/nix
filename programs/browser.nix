{ pkgs, ... }: {
  programs.chromium = {
    enable = true;
    extensions = [
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
      "pkehgijcmpdhfbdbbnkijodmdjhbjlgp" # Privacy Badger
      "ddkjiahejlhfcafbddmgiahcphecmpfh" # uBlock Origin Lite
      "hkgfoiooedgoejojocmhlaklaeopbecg" # PiP by Google
    ];
    extraOpts = {
      "AdsSettingForIntrusiveAdsSites" = 2;
      "AudioSandboxEnabled" = true;
      "BlockThirdPartyCookies" = true;
      "BookmarkBarEnabled" = true;
      "BrowserGuestModeEnabled" = true;
      "BrowserLabsEnabled" = true;
      "ClearBrowsingDataOnExitList" = [
        "browsing_history"
        "download_history"
        "cookies_and_other_site_data"
        "cached_images_and_files"
        "password_signin"
        "autofill"
        "site_settings"
        "hosted_app_data"
      ];
      "DefaultClipboardSetting" = 3;
      "DefaultCookiesSetting" = 4;
      "DefaultFileSystemReadGuardSetting" = 3;
      "DefaultFileSystemWriteGuardSetting" = 3;
      "DefaultGeolocationSetting" = 3;
      "DefaultIdleDetectionSetting" = 2;
      "DefaultNotificationsSetting" = 3;
      "DefaultPopupsSetting" = 2;
      "DefaultSensorsSetting" = 3;
      "DefaultSerialGuardSetting" = 2;
      "DefaultWebBluetoothGuardSetting" = 3;
      "DefaultWebBluetoothHidSetting" = 3;
      "DefaultWebBluetoothUsbSetting" = 3;
      "DefualtWindowManagementSetting" = 2;
      "FeedbackSurveysEnabled" = false;
      "GenAiDefaultSettings" = 2;
      "HomepageIsNewTabPage" = true;
      "PaymentMethodQueryEnabled" = false;
      "PromptForDownloadLocation" = true;
      "RestoreOnStartup" = 1;
      "ShowHomeButton" = true;
    };
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
