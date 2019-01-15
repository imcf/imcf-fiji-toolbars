importClass(Packages.ij.Prefs);


debug = Prefs.get("imcf.debugging", false);
function log_debug(msg) {
    if (debug)
        print(msg);
}


log_debug("ENABLING autostart of IMCF Toolbar.")
Prefs.set("imcf.show_toolbar", true);
Prefs.savePreferences();