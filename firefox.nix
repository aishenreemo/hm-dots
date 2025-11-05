{ config, ... }:
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
      languagePacks = [ "en-US" ];
  
      profiles."aivan" = {
	extraConfig = ''
          user_pref("browser.download.folderList", 2); // 2 = use custom dir
          user_pref("browser.download.dir", "${builtins.toString config.home.homeDirectory}/downloads");
          user_pref("browser.download.useDownloadDir", true); // actually use it
          user_pref("browser.download.manager.showWhenStarting", false);
        '';
        settings = {
          # Set DuckDuckGo as default search engine
          "browser.search.defaultenginename" = "DuckDuckGo";
          "browser.search.selectedEngine" = "DuckDuckGo";
        };
      };

      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value= true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        DisableFirefoxAccounts = false;
        DisableAccounts = false;
        DisableFirefoxScreenshots = true;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "always"; # alternatives: "always" or "newtab"
        DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
        SearchBar = "unified"; # alternative: "separate"

        /* ---- PREFERENCES ---- */
        # Check about:config for options.
        Preferences = { 
          "browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
          "extensions.pocket.enabled" = lock-false;
          "extensions.screenshots.disabled" = lock-true;
          "browser.topsites.contile.enabled" = lock-false;
          "browser.formfill.enable" = lock-false;
          "browser.search.suggest.enabled" = lock-false;
          "browser.search.suggest.enabled.private" = lock-false;
          "browser.urlbar.suggest.searches" = lock-false;
          "browser.urlbar.showSearchSuggestionsFirst" = lock-false;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
          "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-false;
          "browser.newtabpage.activity-stream.showSponsored" = lock-false;
          "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
          "browser.download.folderList" = 2;
          "browser.download.dir" = "${config.home.homeDirectory}/downloads";
          "browser.download.useDownloadDir" = lock-true;
          "browser.download.manager.showWhenStarting" = lock-false;
          "browser.helperApps.neverAsk.saveToDisk" = "application/octet-stream";
        };
      };
    };
  };
}
