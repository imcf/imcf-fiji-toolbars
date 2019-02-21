//@ LogService log

importClass(Packages.ij.Prefs);


log.info("DISABLING autostart of IMCF Toolbar.");
Prefs.set("imcf.show_toolbar", false);
Prefs.savePreferences();
