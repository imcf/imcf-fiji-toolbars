// an auto-run script with some sanity checking (which is basically impossible
// with the macro language as it doesn't allow for catching errors/exceptions)

importClass(Packages.ij.IJ);
importClass(Packages.ij.Prefs);


debug = Prefs.get("imcf.debugging", false);

function log_debug(msg) {
    if (debug)
        print(msg);
}


if (Prefs.get("imcf.show_toolbar", true)) {
    log_debug("IMCF Toolbar is enabled in preferences.");

    // make sure we only launch the bar if the ActionBar plugin is installed:
    try {
        log_debug("Trying to launch the IMCF toolbar...")
        importClass(Packages.Action_Bar);
        IJ.run("IMCF Toolbar", "");
    }
    catch(e) {
        log_debug("Toolbar failed, is the 'ActionBar' plugin installed?");
    }
} else {
    log_debug("IMCF Toolbar is DISABLED in preferences.");
}
