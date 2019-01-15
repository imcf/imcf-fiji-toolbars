importClass(Packages.ij.Prefs);


debug = Prefs.get("imcf.debugging", false);
function log_debug(msg) {
    if (debug)
        print(msg);
}


log_debug("DISABLING autostart of IMCF Toolbar.")
Prefs.set("imcf.show_toolbar", false);
Prefs.savePreferences();