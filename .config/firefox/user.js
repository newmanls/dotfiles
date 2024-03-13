// Enable compact mode
user_pref("browser.compactmode.show", true);
user_pref("browser.uidensity", 1);

// Keep window open when closing last tab
user_pref("browser.tabs.closeWindowWithLastTab", false);
user_pref("browser.download.skipConfirmLaunchExecutable", true);

// Disable URL suggestions
user_pref("browser.urlbar.quicksuggest.enabled", false);
user_pref("browser.urlbar.suggest.topsites", false);

// Disable push notifications
user_pref("dom.push.enabled", false);

// Allow access to http (i.e. not https) sites
user_pref("dom.security.https_only_mode", false);

// Disable pocket
user_pref("extensions.pocket.enabled", false);

// Disable fullscreen popup
user_pref("full-screen-api.warning.timeout", 0);

// Disable Location-Aware Browsing (geolocation)
user_pref("geo.enabled", false);

// Disable printing headers and footers
user_pref("print.print_footerleft", "");
user_pref("print.print_footerright", "");
user_pref("print.print_headerleft", "");
user_pref("print.print_headerright", "");

// Do not prefil forms:
user_pref("signon.prefillForms", false);

// Enable userChrome
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// Enable SVG context-propertes
user_pref("svg.context-properties.content.enabled", true);

// Disable all tabs dropdown menu
user_pref("browser.tabs.tabmanager.enabled", false);

// Tabs in titlebar
user_pref("browser.tabs.inTitlebar", 1);
