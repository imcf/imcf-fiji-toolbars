// an auto-run script with some sanity checking (which is basically impossible
// with the macro language as it doesn't allow for catching errors/exceptions)

importClass(Packages.ij.IJ);
importClass(Packages.ij.Prefs);


if (Prefs.get("imcf.show_toolbar", true)) {
    // print("IMCF Toolbar is enabled in preferences.");

    // make sure we only launch the bar if the ActionBar plugin is installed:
    try {
        importClass(Packages.Action_Bar);
        IJ.run("IMCF Default Toolbar", "");
        // print('success');
    }
    catch(e) {
        // print('fail');
    }
} else {
    // print("IMCF Toolbar is DISABLED in preferences!");
}
