{ config, pkgs, ... }:

  let
    lock-false = {
      Value = false;
      Status = "locked";
    };
    lock-true = {
      Value = true;
      Status = "locked";
    };
  in
{
  programs = {
    firefox = {
      enable = true;
      package = pkgs.firefox-beta;
      languagePacks = [ "en-US" ];

      /* ---- POLICIES ---- */
      # Check about:policies#documentation for options.
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value= true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        #DisablePocket = true;
        #DisableFirefoxAccounts = true;
        #DisableAccounts = true;
        #DisableFirefoxScreenshots = true;
        #OverrideFirstRunPage = "";
        #OverridePostUpdatePage = "";
        #DontCheckDefaultBrowser = true;
        #DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
        #DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
        #SearchBar = "unified"; # alternative: "separate"

        /* ---- EXTENSIONS ---- */
        # Check about:support for extension/add-on ID strings.
        # Valid strings for installation_mode are "allowed", "blocked",
        # "force_installed" and "normal_installed".
        ExtensionSettings = {
          "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
          # uBlock Origin:
          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
          };
          # deArrow:
          "deArrow@ajay.app" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/dearrow/latest.xpi";
            installation_mode = "force_installed";
          };
          # SponsorBlock
          "sponsorBlocker@ajay.app" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
            installation_mode = "force_installed";
          };
          # Dark Reader
          "addon@darkreader.org" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
            installation_mode = "force_installed";
          };
          # Return YT Dislike
          "{1911e113-8c1d-4415-82bb-72a5dc0928d9}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/return-of-the-dislikes/latest.xpi";
            installation_mode = "force_installed";
          };
          # Hide YT Shorts
          "{88ebde3a-4581-4c6b-8019-2a05a9e3e938}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/hide-youtube-shorts/latest.xpi";
            installation_mode = "force_installed";
          };
          # Block Cookies Popups
          "szymon.nikitin@gmail.com" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/block-cookies/latest.xpi";
            installation_mode = "force_installed";
          };
          # Block Google Sign-In Popups
          "{ce25b613-ecd1-47e0-9492-c0260efb633c}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/google-sign-in-popup-blocker/latest.xpi";
            installation_mode = "force_installed";
          };
        };
  
        /* ---- PREFERENCES ---- */
        # Check about:config for options.
        #Preferences = { 
        #  "browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
        #  "extensions.pocket.enabled" = lock-false;
        #  "extensions.screenshots.disabled" = lock-true;
        #  "browser.topsites.contile.enabled" = lock-false;
        #  "browser.formfill.enable" = lock-false;
        #  "browser.search.suggest.enabled" = lock-false;
        #  "browser.search.suggest.enabled.private" = lock-false;
        #  "browser.urlbar.suggest.searches" = lock-false;
        #  "browser.urlbar.showSearchSuggestionsFirst" = lock-false;
        #  "browser.newtabpage.enabled" = lock-false;
        #};
      };
    };
  };
}
